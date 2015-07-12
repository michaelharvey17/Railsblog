class HomeController < ApplicationController
  def login
    @user = User.where(username: params[:username]).first
    if @user && @user.password==params[:password]
      session[:id]=@user.id
      redirect_to "/users/#{@user.username}"
    else 
      redirect_to '/'
    end 
  end 

  def logout
    session.clear
    redirect_to '/'
  end

  def sign_in
    redirect_to '/'
  end
  

 
end 
