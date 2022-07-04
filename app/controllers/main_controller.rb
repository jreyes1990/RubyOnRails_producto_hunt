class MainController < ApplicationController
  def welcome
    redirect_to products_path
    #@name = 'CodigoFacilito'
    #render layout: 'custome'
  end
end
