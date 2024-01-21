class OpportunitiesController < ApplicationController
  before_action :set_opportunity, only: %i[show edit update destroy]
  before_action :build_opportunities, only: :index
  before_action :save_params, only: :index
  before_action :build_index_breadcrumb

  has_scope :search
  has_scope :state

  # GET /Opportunitys or /Opportunitys.json
  def index
    if params[:search]
      breadcrumb "Search: #{params[:search]}", [:opportunities, { search: params[:search] }]
    end
  end

  # GET /Opportunitys/1 or /Opportunitys/1.json
  def show
    breadcrumb @opportunity.name, @opportunity
  end

  # GET /Opportunitys/new
  def new
    breadcrumb "New", [:new, :opportunity]
    @opportunity = Opportunity.new(user: Current.user)
  end

  # GET /Opportunitys/1/edit
  def edit
    breadcrumb @opportunity.name, @opportunity, match: {order: :desc}
    breadcrumb "Edit", [:edit, @opportunity]
  end

  # POST /Opportunitys or /Opportunitys.json
  def create
    @opportunity = Opportunity.new(opportunity_params)

    respond_to do |format|
      if @opportunity.save
        format.html { redirect_to @opportunity, notice: "#{@opportunity.short_name} created." }
        format.json { render :show, status: :created, location: @opportunity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Opportunitys/1 or /Opportunitys/1.json
  def update
    respond_to do |format|
      if @opportunity.update(opportunity_params)
        format.html { redirect_to @opportunity, notice: "#{@opportunity.short_name} saved." }
        format.json { render :show, status: :ok, location: @opportunity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Opportunitys/1 or /Opportunitys/1.json
  def destroy
    @opportunity.destroy!

    respond_to do |format|
      format.html { redirect_to :opportunities, notice: "Opportunity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def build_index_breadcrumb
    breadcrumb "Opportunities", [:opportunities, saved_opportunity_params], match: :exact
  end

  def saved_opportunity_params
    Current.user.data["opportunity_params"].slice(*saveable_params)
  rescue
    {}
  end

  def saveable_params
    ["search", "state"]
  end

  def save_params
    if (params.keys && saveable_params).any?
      Current.user.update(data: { opportunity_params: params } )
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_opportunity
    @opportunity = Opportunity.find(params[:id])
  rescue
    redirect_to [:opportunities], alert: "Sorry, that opportunity does not exist."
  end

  def build_opportunities
    @opportunities = apply_scopes(Current.user.opportunities).includes(:company).company_alphabetical
  end

  # Only allow a list of trusted parameters through.
  def opportunity_params
    opportunity_params = params[:opportunity].permit!.to_h
    if opportunity_params[:company_id].present?
      opportunity_params.delete(:company_attributes)
    else
      opportunity_params[:company_attributes][:user_id] = Current.user.id if opportunity_params[:company_attributes].present?
      opportunity_params.delete(:company_id)
    end

    tmp_params = ActionController::Parameters.new(opportunity: opportunity_params)
    tmp_params[:opportunity].present? ? tmp_params.require(:opportunity).permit(:name, :tags_input, :quick_add, :move_id, :body, :rating, :uri, :state, :posted_on, :applied_on, :company_id, :tag_list, :metrics_enabled, company_attributes: [:id, :name, :uri, :user_id], opportunity_metrics_attributes: [:id, :score]) : {}
  end
end
