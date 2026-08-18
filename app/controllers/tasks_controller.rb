class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.order(created_at: :desc)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: t("controllers.created")
    else
      flash.now[:alert] = t("controllers.failed")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task), notice: t("controllers.updated")
    else
      flash.now[:alert] = t("controllers.failed")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy!
    redirect_to tasks_path, notice: t("controllers.destroyed")
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.expect(task: [:title, :description])
  end

end
