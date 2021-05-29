# frozen_string_literal: true

class Api::V1::ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update]

  def index
    @projects = Project.all
    render json: @projects
  end

  def create
    @project = Project.new(permitted_params)

    if @project.save
      render json: @project, status: :created
    else
      render_error
    end
  end

  def show
    render json: @project
  end

  def update
    if @project.update(permitted_params)
      render json: @project
    else
      render_error
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def permitted_params
    params.require(:project).permit(
      :name,
      :started_at,
      :ended_at
    )
  end
end