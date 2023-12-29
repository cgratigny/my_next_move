class NotesController < ApplicationController
  before_action :set_notable
  before_action :build_note, only: %i[ new create ]
  before_action :set_note, only: %i[ show edit update destroy ]
  before_action :build_notes, only: :index

  before_action :set_notable_breadcrumb

  # GET /notes or /notes.json
  def index
  end

  # GET /notes/1 or /notes/1.json
  def show
    raise NotImplementedError unless request.headers["Turbo-Frame"].present?
  end

  # GET /notes/new
  def new
    breadcrumb "New Note", [:new, @notable, :note]
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes or /notes.json
  def create
    respond_to do |format|
      if @note.save
        format.html { redirect_to [@note.notable, @note], notice: "Note was successfully created." }
        format.json { render :show, status: :created, location: [@note.notable, @note] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1 or /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to note_url(@note), notice: "Note was successfully updated." }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1 or /notes/1.json
  def destroy
    @note.destroy!

    respond_to do |format|
      format.html { redirect_to notes_url, notice: "Note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def set_notable_breadcrumb
    breadcrumb "Opportunities", [:opportunities], match: :exact
    breadcrumb @notable.short_name, @notable, match: :exact if @notable.present?
  end

  private
    def build_note
      @note = Note.new( { notable: @notable }.merge(note_params))
    end

    def build_notes
      if @notable.present?
        @notes = @notable.notes
      else
        @notes = Current.user.notes
      end
    end

    def set_notable
      params.each do |key, value|
        if key.include?("_id")
          @notable = key.gsub("_id", "").camelcase.constantize.find(value)
        end
      end
    end

    def allowed_objects
      [Opportunity, Company]
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.fetch(:note, {}).permit!
    end
end
