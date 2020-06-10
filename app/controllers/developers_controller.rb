class DevelopersController < ApplicationController

  def index
    @developer = Developer.all
  end


end
