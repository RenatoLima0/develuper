class PortifoliosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show,]
  before_action :set_portifolio, only: [:show, :edit, :update, :destroy]

  def index
    @portifolios = Portifolio.all
  end

  def new
    @developer = current_user 
    @portifolio = Portifolio.new
  end

  def create
    @portifolio = Portifolio.new(portifolio_params)
    @portifolio.developer = current_user.developer

    
    if @portifolio.save
      redirect_to portifolios_path, notice: 'Portifolio was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @portifolio.destroy
    redirect_to portifolios_url, notice: 'Deleted!'
  end

  def update
    if @portifolio.update(portifolio_params)
      redirect_to portifolios_url, notice: 'Portifolio was successfully updated.'
    else
      render :edit
    end
  end

  private

  def portifolio_params
    params.require(:portifolio).permit(:link, :photo, :title)
  end

  def set_portifolio  
    @portifolio = Portifolio.find(params[:id])
  end

end
