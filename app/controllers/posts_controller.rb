class PostsController < ApplicationController
  def new
    @post=Post.new

  end

  def create
    @post=Post.new(params[:post])

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
  end

end 
