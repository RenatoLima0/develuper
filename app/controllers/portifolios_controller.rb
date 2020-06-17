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

    # raise
    if @portifolio.save
      redirect_to @portifolios, notice: 'Portifolio was successfully created.'
    else
      render :new
    end
  end

  private

  def portifolio_params
    params.require(:portifolio).permit(:link, :photo)
  end

  def set_portifolio  
    @portifolio = Portifolio.find(params[:id])
  end

end
