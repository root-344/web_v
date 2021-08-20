class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
  end

  def create
    @post = Post.new(content: params[:content])
    @post.save
    redirect_to root_path
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.save
    redirect_to root_path
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to root_path
  end
end
