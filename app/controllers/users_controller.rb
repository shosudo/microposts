class UsersController < ApplicationController
  def show
    user_find
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
        #Key is :success and value is Welcome to--
        redirect_to @user
        #redirect_to user_path(@user)
      else
        render 'new'
      end
  end
  
  def edit
    user_find
    if(current_user != @user)
      redirect_to root_path
    end
  end
  
  def update
    user_find
    if(current_user != @user)
      redirect_to root_path
    end
    if @user.update_attributes(user_params)
      redirect_to @user, notice: 'Save succeed'
    else
      flash.now[:alert] = "update failed"
      render 'edit'
    end
  end
  
  
  private

  def user_find
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:address)
  end
    

end
