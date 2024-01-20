class OpportunityMetricsController < ApplicationController
  before_action :set_opportunity_metric, only: %i[ show edit update destroy ]
  before_action :find_move, only: [:index]

  breadcrumb "Moves", [:moves], match: :exact

  # GET /opportunity_metrics or /opportunity_metrics.json
  def index
    breadcrumb @move.name, [@move], match: :exact
    breadcrumb "Opportunity Metrics", [@move, :opportunity_metrics], match: :exact
    @opportunities = @move.opportunities.metrics_enabled.order(ranking: :asc)
  end

  # GET /opportunity_metrics/1 or /opportunity_metrics/1.json
  def show
  end

  # GET /opportunity_metrics/new
  def new
    @opportunity_metric = OpportunityMetric.new
  end

  # GET /opportunity_metrics/1/edit
  def edit
  end

  # POST /opportunity_metrics or /opportunity_metrics.json
  def create
    @opportunity_metric = OpportunityMetric.new(opportunity_metric_params)

    respond_to do |format|
      if @opportunity_metric.save
        format.html { redirect_to opportunity_metric_url(@opportunity_metric), notice: "Opportunity metric was successfully created." }
        format.json { render :show, status: :created, location: @opportunity_metric }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @opportunity_metric.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opportunity_metrics/1 or /opportunity_metrics/1.json
  def update
    respond_to do |format|
      if @opportunity_metric.update(opportunity_metric_params)
        format.html { redirect_to opportunity_metric_url(@opportunity_metric), notice: "Opportunity metric was successfully updated." }
        format.json { render :show, status: :ok, location: @opportunity_metric }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @opportunity_metric.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opportunity_metrics/1 or /opportunity_metrics/1.json
  def destroy
    @opportunity_metric.destroy!

    respond_to do |format|
      format.html { redirect_to opportunity_metrics_url, notice: "Opportunity metric was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def find_move
      @move = Move.find(params[:move_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_opportunity_metric
      @opportunity_metric = OpportunityMetric.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def opportunity_metric_params
      params.fetch(:opportunity_metric, {})
    end
end
