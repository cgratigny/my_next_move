class DailyOpportunityStatsController < ApplicationController
  before_action :set_daily_opportunity_stat, only: %i[ show edit update destroy ]
  before_action :build_current_daily_opportunity_stat, only: [:index]

  # GET /daily_opportunity_stats or /daily_opportunity_stats.json
  def index
    @daily_opportunity_stats = DailyOpportunityStat.order(date: :desc)
  end

  # GET /daily_opportunity_stats/1 or /daily_opportunity_stats/1.json
  def show
  end

  # GET /daily_opportunity_stats/new
  def new
    @daily_opportunity_stat = DailyOpportunityStat.new
  end

  # GET /daily_opportunity_stats/1/edit
  def edit
  end

  # POST /daily_opportunity_stats or /daily_opportunity_stats.json
  def create
    @daily_opportunity_stat = DailyOpportunityStat.new(daily_opportunity_stat_params)

    respond_to do |format|
      if @daily_opportunity_stat.save
        format.html { redirect_to daily_opportunity_stat_url(@daily_opportunity_stat), notice: "Daily opportunity stat was successfully created." }
        format.json { render :show, status: :created, location: @daily_opportunity_stat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @daily_opportunity_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_opportunity_stats/1 or /daily_opportunity_stats/1.json
  def update
    respond_to do |format|
      if @daily_opportunity_stat.update(daily_opportunity_stat_params)
        format.html { redirect_to daily_opportunity_stat_url(@daily_opportunity_stat), notice: "Daily opportunity stat was successfully updated." }
        format.json { render :show, status: :ok, location: @daily_opportunity_stat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @daily_opportunity_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_opportunity_stats/1 or /daily_opportunity_stats/1.json
  def destroy
    @daily_opportunity_stat.destroy!

    respond_to do |format|
      format.html { redirect_to daily_opportunity_stats_url, notice: "Daily opportunity stat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def build_current_daily_opportunity_stat
      @current_daily_opportunity_stat = DailyOpportunityStat.new(DailyOpportunityStatGeneratorService.new(date: Date.today).build_daily_opportunity_stat)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_opportunity_stat
      @daily_opportunity_stat = DailyOpportunityStat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def daily_opportunity_stat_params
      params.fetch(:daily_opportunity_stat, {})
    end
end
