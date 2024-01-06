class TasksController < ApplicationController
  before_action :set_taskable
  before_action :build_task, only: %i[new create]
  before_action :set_task, only: %i[show edit update destroy]
  before_action :build_tasks, only: :index

  before_action :set_taskable_breadcrumb

  # GET /tasks or /tasks.json
  def index
    breadcrumb "Tasks", [@taskable, :tasks]
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    breadcrumb "Tasks", [@taskable, :tasks], match: :exact
    breadcrumb @task.name, [@taskable, @task]
  end

  # GET /tasks/new
  def new
  end

  # GET /tasks/1/edit
  def edit
    breadcrumb "Tasks", [@taskable, :tasks], match: :exact
    breadcrumb @task.name, [@taskable, @task]
  end

  # POST /tasks or /tasks.json
  def create
    respond_to do |format|
      if @task.save
        format.html { redirect_to task_url(@task), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy!

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
      format.turbo_stream
    end
  end

  def set_taskable_breadcrumb
    if @taskable.present?
      breadcrumb @taskable.class.name.to_s.pluralize, [:opportunities], match: :exact
      breadcrumb @taskable.short_name, @taskable, match: :exact
    end
  end

  private

  def build_task
    @task = Task.new({taskable: @taskable}.merge(task_params))
  end

  def build_tasks
    @tasks = if @taskable.present?
      @taskable.tasks.todo
    else
      Current.user.tasks.todo
    end
  end

  def set_taskable
    params.each do |key, value|
      if key.include?("_id")
        @taskable = key.gsub("_id", "").camelcase.constantize.find(value)
      end
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.fetch(:task, {}).permit!
  end
end
