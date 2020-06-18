class DevelopersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  # before_action :set_devoloper, only: [:show, :edit, :update, :destroy]

  def index
    @developers = Developer.where.not(user: current_user)
    users = User.where.not(id: current_user.id, role: "Project Owner")
    users = users.geocoded # returns developers with coordinates
    @markers = users.map do |developer|
      {
        lat: developer.latitude,
        lng: developer.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { developer: developer }),
        image_url: helpers.asset_url('rocket.png')
      }
    end
  end

  def show 
    @developer = Developer.find(params[:id])
    @markers = []
    @markers << {
      lat: @developer.user.latitude,
      lng: @developer.user.longitude,
      image_url: helpers.asset_url('rocket.png')
    }
  end 

  # def new
  #   @developer = Developer.new
  # end

  # def create
  #   @developer = Developer.new(developer_params)
  #   devoloper = Devoloper.create(user_id: current_user.id)

  #   @devoloper.devoloper = devoloper
  #   if @devoloper.save
  #     redirect_to @devoloper, notice: 'Create Sucessfully'
  #   else
  #     render 'new'
  #   end
  # end

  # def edit
  # end

  # def destroy
  #   @devoloper.destroy
  #   redirect_to devolopers_url, notice: 'Deleted!'
  # end

  # def update
  #   if @devoloper.update(devoloper_params)
  #     redirect_to @devoloper, notice: 'devoloper was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  private

  # def devoloper_params
  #   params.require(:devoloper).permit(:address, :title, :description)
  # end

  # def set_devoloper
  #   @devoloper = Devoloper.find(params[:id])
  # end

end

