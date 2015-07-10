class HomeController < ApplicationController
  def index

  end

  def logout
    session.clear
    redirect_to '/'
  end
  

 
end 
