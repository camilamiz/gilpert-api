#frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update]

  def index
    @tasks = Tasks.all
  end

  def show
    render json: @task
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

  def edit
  end

  def update
    if @task.update(permitted_params)
      render json: @task
    else
      render_error
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

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

  def render_error
    render json: { errors: @task.errors.full_messages },
      status: :unprocessable_entity
  end
end
