class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]
  before_action :build_company, only: %i[new create]
  before_action :build_companies, only: :index

  breadcrumb "Companies", [:companies], match: :exact

  # GET /companies or /companies.json
  def index
  end

  # GET /companies/1 or /companies/1.json
  def show
  end

  # GET /companies/new
  def new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies or /companies.json
  def create
    respond_to do |format|
      if @company.save
        build_companies
        format.html { redirect_to company_url(@company), notice: "Company was successfully created." }
        format.json { render :show, status: :created, location: @company }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to company_url(@company), notice: "Company was successfully updated." }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1 or /companies/1.json
  def destroy
    @company.destroy!

    respond_to do |format|
      format.html { redirect_to companies_url, notice: "Company was successfully destroyed." }
      format.json { head :no_content }
      format.turbo_stream
    end
  end

  private

  def build_companies
    @companies = Current.user.companies.distinct.alphabetical
  end

  def build_company
    @company = Company.new(company_params.merge(user: Current.user))
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def company_params
    params.fetch(:company, {}).permit!
  end
end
