class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
 
  def new
    @user = User.new
    #Userクラスの新しいインスタンスを作成して、UsersControllerのインスタンス変数@userに代入
  end
  
  def create
  #postで送信されたparamsを元に@userデータを作成
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample application!"
      #Key is :success and value is Welcome to---
      redirect_to @user
      #redirect_to user_path(@user)
    else
      render 'new'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
    

end
