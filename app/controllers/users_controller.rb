class UsersController < ApplicationController
  def new
    @user = User.new 
  end
  def sign_up
    
  end

  def edit
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
