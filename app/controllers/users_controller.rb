class UsersController < ApplicationController

  def index
    # @users = User.where.not(project_owner: current_user.project_owner)
    # @users = @users  .geocoded # returns users with coordinates

    # @markers = @users.map do |user|
    #   {
    #     lat: user.latitude,
    #     lng: user.longitude
    #   }
    # end
  end

  def show
  end

end
