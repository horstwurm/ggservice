class HomeController < ApplicationController
  def index
    if params[:name] and params[:vorname] and params[:pw] and params[:name].length > 0 and params[:vorname].length >0 and params[:pw].length>0
      redirect_to taxes_path :name => params[:name], :vorname => params[:vorname], :pw => params[:pw]
    else
      @message = "bitte alle drei Felder ausfüllen!"
      #redirect_to home_index_path
    end 
  end
end
