class UsersController < ApplicationController
   before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def new
    @user = User.new
    redirect_to '/sign_up'
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
    @user = User.find_by(username: params[:id])
    @posts = Post.where(user_id: @user.id).reverse
  end

  def create 
    @user = User.new(params[:user])
    @user.save
    if @user.save
      session[:id]=@user.id
       redirect_to "/users/#{@user.username}", notice: "New Account has been created!"
    else
      redirect_to '/sign_up'
    end 
  end 
end 


