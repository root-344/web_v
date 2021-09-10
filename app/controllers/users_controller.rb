class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update]}
  before_action :side_index, {except: :update}
  
  def index
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(first_name: params[:first_name], 
                     last_name: params[:last_name], 
                     first_name_kana: params[:first_name_kana], 
                     last_name_kana: params[:last_name_kana], 
                     nickname: [:nickname], 
                     email: params[:email], 
                     password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "新規登録完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("/users/new")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.first_name_kana = params[:first_name_kana]
    @user.last_name_kana = params[:last_name_kana]
    @user.nickname = params[:nickname]
    @user.email = params[:email]
    @user.password = params[:password]
    if @user.save
      flash[:notice] = "ユーザー情報を変更しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  def login_form
    @user = User.new
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/posts/index")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "あなたには出来ませんよ"
      redirect_to("/posts/index")
    end
  end


end
