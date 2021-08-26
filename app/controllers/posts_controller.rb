class PostsController < ApplicationController

  def index
    @posts = Post.all
    @users = User.all
  end

  def new
    @post = Post.new
    @users = User.all
  end

  def create
    @users = User.all
    @post = Post.new(content: params[:content])
    if @post.save
      flash[:notice] = "投稿を作成しました。画面をクリックすると消えます。"
      redirect_to("/users/#{@user.id}")
    else
      render("posts/new")
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @users = User.all

  end

  def edit
    @post = Post.find_by(id: params[:id])
    @users = User.all
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "内容を変更しました。画面をクリックすると消えます。"
      redirect_to root_path      
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.destroy
      flash[:notice] = "投稿を削除しました。画面をクリックすると消えます。"
      redirect_to root_path
    else
      render("posts/edit")
    end
  end
end
