class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy ]
  PER = 3

  def index
    if params[:sort_expired]
      @tasks = Task.order(expired_at: :desc).page(params[:page]).per(PER)
    elsif params[:sort_priority]
      @tasks = Task.order(priority: :desc).page(params[:page]).per(PER)
    elsif params[:search]
      if params[:search_title].present? && params[:search_status].present?
        @tasks = Task.search_title(params[:search_title]).search_status(params[:search_status]).page(params[:page]).per(PER)
      elsif params[:search_title].present?
        @tasks = Task.search_title(params[:search_title]).page(params[:page]).per(PER)
      elsif params[:search_status].present?
        @tasks = Task.search_status(params[:search_status]).page(params[:page]).per(PER)
      else
        @tasks = Task.order(created_at: :desc).page(params[:page]).per(PER)
      end
    else
      @tasks = Task.order(created_at: :desc).page(params[:page]).per(PER)
    end
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
      if params[:back]
        render :new
    else
      if @task.save
        redirect_to tasks_path, notice: "Task was successfully created."
      else
        render :new
      end
    end
  end

  def update
      if @task.update(task_params)
        redirect_to task_path(@task), notice: "Task was successfully updated."
      else
        render :edit
    end
  end

  def destroy
    @task.destroy
     redirect_to tasks_path, notice: "Task was successfully deleted."
  end

  def confirm
    @task = Task.new(task.params)
    render :new if @task.invalid?
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :expired_at, :status, :priority)
  end
end
