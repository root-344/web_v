class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @users = User.all
    @user = User.find_by(id: params[:id])
  end

  def new
    @users = User.all
    @user = User.new
  end

  def create
    @users = User.all
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      flash[:notice] = "新規登録完了しました"
      redirect_to("users/#{@user.id}")
    else
      render("/users/new")
    end
  end

  def edit
    @users = User.all
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    if @user.save
      flash[:notice] = "ユーザー情報を変更しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

end
