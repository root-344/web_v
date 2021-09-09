class PostsController < ApplicationController
  before_action :authenticate_user, {except: :index}
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  before_action :side_index, {except: [:update, :destroy]}


  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(team_name: params[:team_name], genre_id: params[:genre_id], date: params[:date], content: params[:content], user_id: @current_user.id)
    if @post.save
      flash[:notice] = "投稿を作成しました。画面をクリックすると消えます。"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @comments = @post.comments
    @comment = Comment.new

  end

  def edit
    @post = Post.find_by(id: params[:id])
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
