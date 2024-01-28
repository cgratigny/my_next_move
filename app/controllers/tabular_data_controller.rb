class TabularDataController < ApplicationController
  before_action :set_tabular_datum, only: %i[ show edit update destroy ]

  # GET /tabular_data or /tabular_data.json
  def index
    @tabular_data = TabularDatum.order(position: :asc)
  end

  # GET /tabular_data/1 or /tabular_data/1.json
  def show
  end

  # GET /tabular_data/new
  def new
    @tabular_datum = TabularDatum.new
  end

  # GET /tabular_data/1/edit
  def edit
  end

  # POST /tabular_data or /tabular_data.json
  def create
    @tabular_datum = TabularDatum.new(tabular_datum_params)

    respond_to do |format|
      if @tabular_datum.save
        format.html { redirect_to tabular_datum_url(@tabular_datum), notice: "Tabular datum was successfully created." }
        format.json { render :show, status: :created, location: @tabular_datum }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tabular_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tabular_data/1 or /tabular_data/1.json
  def update
    respond_to do |format|
      if @tabular_datum.update(tabular_datum_params)
        format.html { redirect_to tabular_datum_url(@tabular_datum), notice: "Tabular datum was successfully updated." }
        format.json { render :show, status: :ok, location: @tabular_datum }
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tabular_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tabular_data/1 or /tabular_data/1.json
  def destroy
    @tabular_datum.destroy!

    respond_to do |format|
      format.html { redirect_to tabular_data_url, notice: "Tabular datum was successfully destroyed." }
      format.json { head :no_content }
      format.turbo_stream
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tabular_datum
    @tabular_datum = TabularDatum.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tabular_datum_params
    params.fetch(:tabular_datum, {}).permit(:position, :title)
  end
end
