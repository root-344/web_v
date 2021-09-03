class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}


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
    @post = Post.new(content: params[:content], user_id: @current_user.id)
    if @post.save
      flash[:notice] = "投稿を作成しました。画面をクリックすると消えます。"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def show
    @users = User.all
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @comments = @post.comments
    @comment = Comment.new

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

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user.id != @current_user.id
      flash[:notice] = "あなたには出来ませんよ"
      redirect_to("/posts/index")
    end
  end


end
