class OpportunitiesController < ApplicationController
  before_action :set_opportunity, only: %i[ show edit update destroy ]

  breadcrumb "Opportunities", [:opportunities], match: :exact

  # GET /Opportunitys or /Opportunitys.json
  def index
    @opportunities = Opportunity.all.includes(:company).joins(:company).company_alphabetical
  end

  # GET /Opportunitys/1 or /Opportunitys/1.json
  def show
    breadcrumb @opportunity.short_name, @opportunity
  end

  # GET /Opportunitys/new
  def new
    breadcrumb "New", [:new, :opportunity]
    @opportunity = Opportunity.new
  end

  # GET /Opportunitys/1/edit
  def edit
    breadcrumb @opportunity.short_name, @opportunity, match: {order: :desc}
    breadcrumb "Edit", [:edit, @opportunity]
  end

  # POST /Opportunitys or /Opportunitys.json
  def create
    @opportunity = Opportunity.new(opportunity_params)

    respond_to do |format|
      if @opportunity.save
        format.html { redirect_to :opportunities, notice: "#{@opportunity.short_name} created." }
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
        format.html { redirect_to :opportunities, notice: "#{@opportunity.short_name} saved." }
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
      _params[:opportunity].present? ? _params.require(:opportunity).permit(:name, :body, :uri, :state, :posted_on, :applied_on, :company_id, company_attributes: [:id, :name, :uri]) : {}
    end

end
