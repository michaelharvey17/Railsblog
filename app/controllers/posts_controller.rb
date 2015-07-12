class PostsController < ApplicationController
  def new
    @newpost=Post.new(user_id: session[:id])
    @newpost.save
    redirect_to "/posts/#{@newpost.id}"
  end

  def create
    @post=Post.new(post_params)
    @post[:user_id]=session[:id]
    @post.save
  end

  def comment
    @comment=Post.new(post_params)
    @comment[:user_id]=session[:id]
    @comment[:post_id]=params[:id]
    @comment.save
    redirect_to "/posts/#{params[:id]}"
  end

  def edit
    @update=Post.update(params[:id], content: post_params[:content])
    redirect_to "/posts/#{params[:id]}"
  end

  def delete
    @post=Post.find(params[:id])
    Post.find(params[:id]).destroy
    if @post.post_id==nil
      redirect_to "/users/#{User.find(session[:id]).username}"
    else
      redirect_to "/posts/#{@post.post_id}"
    end
    
  end

  def show
    @post=Post.find(params[:id])
    @comments=Post.where(post_id: @post.id).reverse
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end 
