class OpportunitiesController < ApplicationController
  before_action :set_opportunity, only: %i[ show edit update destroy ]
  before_action :build_opportunities, only: :index

  has_scope :search

  breadcrumb "Opportunities", [:opportunities], match: :exclusive

  # GET /Opportunitys or /Opportunitys.json
  def index
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
    # Use callbacks to share common setup or constraints between actions.
    def set_opportunity
      @opportunity = Opportunity.find(params[:id])
    rescue
      redirect_to [:opportunities], alert: "Sorry, that opportunity does not exist."
    end

    def build_opportunities
      @opportunities = apply_scopes(Current.user.opportunities).includes(:company).active.company_alphabetical
    end
    # Only allow a list of trusted parameters through.
    def opportunity_params
      opportunity_params = params[:opportunity].permit!.to_h
      if opportunity_params[:company_id].present?
        opportunity_params.delete(:company_attributes)
      else
        opportunity_params.delete(:company_id)
      end

      _params = ActionController::Parameters.new(opportunity: opportunity_params)
      _params[:opportunity].present? ? _params.require(:opportunity).permit(:name, :tags_input, :quick_add, :move_id, :body, :rating, :uri, :state, :posted_on, :applied_on, :company_id, :tag_list, company_attributes: [:id, :name, :uri]) : {}
    end

end
