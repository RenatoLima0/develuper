class DashboardsController < ApplicationController
  def index
    # @projects = Project.where.not(project_owner: current_user.project_owner)
    @projects = Project.where(project_owner: current_user.project_owner)
    @projects = @projects.geocoded # returns projects with coordinates
    @developers = User.where(id: current_user.id)
    @developers = @developers.geocoded # returns developers with coordinates
    @markers = @projects.map do |project|
      {
        lat: project.latitude,
        lng: project.longitude,
        infoWindow: render_to_string(partial: "projects/info_window", locals: { project: project }),
        image_url: helpers.asset_url('idea.png')
      }
    end
    @developers.each do |developer|
      @markers << {
        lat: developer.latitude,
        lng: developer.longitude,
        infoWindow: render_to_string(partial: "developers/info_window", locals: { developer: developer }),
        image_url: helpers.asset_url('rocket.png')
      }
    end
#if para implementação do search
    if params[:query].present?
      sql_query = " \
        projects.title @@ :query \
        OR projects.description @@ :query \
        OR projects.address @@ :query \
        "
      @projects = Project.joins(:project_owner).where(sql_query, query: "%#{params[:query]}%")
    else
      @projects = Project.all
    end

  end



end
