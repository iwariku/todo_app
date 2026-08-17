class TasksController < ApplicationController
  def index
    @tasks = Task.order(created_at: :desc)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(title: params[:task][:title], description: params[:task][:description])
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end
end
