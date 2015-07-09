class PostsController < ApplicationController
  def new
    @post=Post.new

  end

  def create
    @post=Post.new(params[:post])
    @post[:user_id]=session[:id]
    @post.save
  end

  def comment
    @comment=Post.new(params[:post])
    @comment[:user_id]=session[:id]
    @comment[:post_id]=params[:id]
    @comment.save
    redirect_to "/posts/#{params[:id]}"
  end

  def edit
    @update=Post.update(params[:id], content: params[:post][:content])
    redirect_to "/posts/#{params[:id]}"
  end

  def delete
    @post=Post.find(params[:id])
    if @post.post_id==nil
      redirect_to '/users/#{User.find(session[:id]).username}'
    else
      redirect_to "/posts/#{@post.post_id}"
    end
    @post.destroy
  end

  def show
    @post=Post.find(params[:id])
    @comments=Post.where(post_id: @post.id).reverse
    session[:id]=1
  end

end 
