class OpportunitiesController < ApplicationController
  before_action :set_opportunity, only: %i[ show edit update destroy ]

  # GET /Opportunitys or /Opportunitys.json
  def index
    @opportunities = Opportunity.all.order(created_at: :desc)
  end

  # GET /Opportunitys/1 or /Opportunitys/1.json
  def show
  end

  # GET /Opportunitys/new
  def new
    @opportunity = Opportunity.new(company: Company.new)
  end

  # GET /Opportunitys/1/edit
  def edit
  end

  # POST /Opportunitys or /Opportunitys.json
  def create
    @opportunity = Opportunity.new(opportunity_params)

    respond_to do |format|
      if @opportunity.save
        format.html { redirect_to [@opportunity], notice: "Opportunity was successfully created." }
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
        format.html { redirect_to [@opportunity], notice: "Opportunity was successfully updated." }
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
      params[:opportunity].present? ? params.require(:opportunity).permit(:name, :uri, :state, :applied_on, company_attributes: [:id, :name, :uri]) : {}
    end

end
