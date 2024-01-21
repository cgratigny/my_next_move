class MovesController < ApplicationController
  before_action :set_move, only: %i[show edit update destroy]
  before_action :build_move, only: [:new, :create]
  before_action :build_breadcrumbs

  # The line `breadcrumb "Moves", [:moves]` is defining a breadcrumb for the MovesController.
  # Breadcrumbs are a way to provide navigation links that show the user's current location within the
  # application's hierarchy.
  
  # GET /moves or /moves.json
  def index
    @moves = Current.user.moves
  end

  # GET /moves/1 or /moves/1.json
  def show
  end

  # GET /moves/new
  def new
  end

  # GET /moves/1/edit
  def edit
  end

  # POST /moves or /moves.json
  def create
    respond_to do |format|
      if @move.save
        format.html { redirect_to [:dashboard], notice: "Move was successfully created." }
        format.json { render :show, status: :created, location: @move }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @move.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moves/1 or /moves/1.json
  def update
    respond_to do |format|
      if @move.update(move_params)
        format.html { redirect_to move_url(@move), notice: "Move was successfully updated." }
        format.json { render :show, status: :ok, location: @move }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @move.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moves/1 or /moves/1.json
  def destroy
    @move.destroy!

    respond_to do |format|
      format.html { redirect_to moves_url, notice: "Move was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def build_breadcrumbs
    breadcrumb "Moves", [:moves], match: :exact
    breadcrumb @move.name, [@move] if @move.present?
  end

  def build_move
    @move = Move.new(move_params.merge({user: Current.user}))
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_move
    @move = Move.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def move_params
    params[:move].present? ? params.require(:move).permit(:name, :description, :starts_on, :goal_on, :state, :stops_on) : {}
  end
end
