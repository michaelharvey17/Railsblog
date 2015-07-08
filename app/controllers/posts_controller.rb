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
    Post.find(params[:id]).destroy
  end

  def show
    @post=Post.find(params[:id])
    @comments=Post.where(post_id: @post.id).last(10)
    session[:id]=2
  end

end 
