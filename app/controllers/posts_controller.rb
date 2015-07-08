class PostsController < ApplicationController
  def new
    @post=Post.new

  end

  def create
    @post=Post.new(params[:post])
    @post[:user_id]=session[:id]

  end

  def comment
    @comment=Post.new(params[:post])
    @comment[:user_id]=session[:id]
    @comment[:post_id]=Post.find(params[:id])[:id]
  end

  def edit
    @post=Post.find(params[:id])
    Post.find(params[:id]).update(content: params[:content])
  end

  def delete
    Post.find(params[:id]).destroy
  end

  def show
    @post=Post.find(params[:id])
    @comments=Post.where(post_id: @post.id).last(10)
  end

end 
