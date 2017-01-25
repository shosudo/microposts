class UsersController < ApplicationController
  def show
    user_find
    @microposts = @user.microposts.order(created_at: :desc)
    #ユーザーに紐付いたmicropostを作成日時が新しいモノから取得
  end
 
  def new
    @user = User.new
    #Userクラスの新しいインスタンスを作成して、UsersControllerのインスタンス変数@userに代入
  end
  
  def create
  #postで送信されたparamsを元に@userデータを作成
    @user = User.new(user_params)
      if @user.save
        flash.now[:success] = "Welcome to the Sample application!"
        #Key is :success and value is Welcome to--
        session[:user_id] = @user.id
        redirect_to @user
        #redirect_to user_path(@user)
      else
        render 'new'
      end
  end
  
  def edit
    user_find
    check_login
  end
  
  def update
    user_find
    check_login
    if @user.update_attributes(user_params)
      flash[:success] = "変更を保存しました"
      redirect_to @user
    else
      flash.now[:danger] = "保存に失敗しました"
      render 'edit'
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @following = @user.following_users.order(created_at: :desc)
  end
  
  def followers
    @user = User.find(params[:id])
    @follower = @user.follower_users.order(created_at: :desc)
  end
  
  private

  def user_find
    @user = User.find(params[:id])
  end
  
  def check_login
    if(current_user != @user)
      redirect_to root_path
    end
  end
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:address,:profile)
  end

end
