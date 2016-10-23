class HomeController < ApplicationController
  def index
    if params[:name]
      redirect_to taxes_path :name => params[:name], :pw => params[:pw]
    end 
  end
end
