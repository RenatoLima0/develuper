class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.where.not(project_owner: current_user.project_owner)
    @projects = @projects  .geocoded # returns projects with coordinates

    @markers = @projects.map do |project|
      {
        lat: project.latitude,
        lng: project.longitude
      }
    end
  end

  def show 
    @project = Project.find(params[:id])
  end 

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    project_owner = ProjectOwner.create(user_id: current_user.id)

    @project.project_owner = project_owner
    if @project.save
      redirect_to @project, notice: 'Create Sucessfully'
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Deleted!'
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  private

  def project_params
    params.require(:project).permit(:address, :title, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  end

end
