#frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Tasks.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(permitted_params)

    if @task.save
      render json: @task, status: :created
    else
      render_error
    end
  end

  # def edit
  # end

  # def update
  # end

  private

  def permitted_params
    params.require(:task).permit(
      :description,
      :optimistic,
      :most_likely,
      :pessimistic,
      :actual,
      :started_at,
      :ended_at
    )
  end
end
