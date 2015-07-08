class PostsController < ApplicationController
  def new
    @post=Post.new

  end

  def create
    @post=Post.new(params[:post])

  end

  def delete
    Post.find(params[:id]).destroy

end 
