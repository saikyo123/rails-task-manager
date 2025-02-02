# frozen_string_literal: true

class TasksController < ApplicationController
  # before_action :set_task, only: [:show, :edit]

  def list
     @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

    # def set_task
    #   @task = Task.find(params[:id])
    # end
    def task_params
      params.require(:task).permit(:title, :details)
    end
end
