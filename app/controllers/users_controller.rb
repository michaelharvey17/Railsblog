class UsersController < ApplicationController
   before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def new
    @user = User.new 
  end

  def sign_up
    
  end

  def login
      user = User.new
    if request.post?
      if session[:user] = User.authenticate(params[:user][:login], 
params[:user][:password])
        flash[:message]  = "Login successful"
        redirect_to :root
      else
        flash[:warning] = "Username or password does not exist"
      end
    end 
  end 
  


  def edit
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def create 
    @user = User.new(params.require(:user).permit(:username, :email, :lname, :fname, :password, :password_confirmation))
    if @user.save 
       redirect_to @user, notice: "New Account has been created!"
    else
      render :new 
    end 
  end 
end 


