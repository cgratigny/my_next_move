class MetricsController < ApplicationController
  before_action :set_metric, only: %i[ show edit update destroy ]

  before_action :set_move
  before_action :build_metric, only: [:new, :create]

  # GET /metrics or /metrics.json
  def index
    @metrics = Metric.all
  end

  # GET /metrics/1 or /metrics/1.json
  def show
  end

  # GET /metrics/new
  def new
  end

  # GET /metrics/1/edit
  def edit
  end

  # POST /metrics or /metrics.json
  def create
    respond_to do |format|
      if @metric.save
        format.html { redirect_to [@metric.move, @metric], notice: "Metric was successfully created." }
        format.json { render :show, status: :created, location: @metric }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @metric.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /metrics/1 or /metrics/1.json
  def update
    respond_to do |format|
      if @metric.update(metric_params)
        format.html { redirect_to [@metric.move, @metric], notice: "Metric was successfully updated." }
        format.json { render :show, status: :ok, location: [@metric.move, @metric] }
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @metric.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /metrics/1 or /metrics/1.json
  def destroy
    @metric.destroy!

    respond_to do |format|
      format.html { redirect_to metrics_url, notice: "Metric was successfully destroyed." }
      format.json { head :no_content }
      format.turbo_stream
    end
  end

  private

  def build_metric
    @metric = Metric.new( metric_params.merge(move: @move) )
  end

  def set_move
    @move = Current.user.moves.find(params[:move_id])
  end

    # Use callbacks to share common setup or constraints between actions.
  def set_metric
    @metric = Metric.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def metric_params
    params[:metric].present? ? params.require(:metric).permit(:name, :position) : {}
  end

end
