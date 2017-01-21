class SessionsController < ApplicationController
  def new
  end
  
  def create
    #new.htmlで入力したEmailとPasswordがparams[:session]に入っている。
    @user = User.find_by(email: params[:session][:email].downcase)
    #Userをsessionの中のemailから検索
    if @user && @user.authenticate(params[:session][:password])
    #見つかった場合、passwordがただしいかauthenticate methodで調べる
      session[:user_id]=@user.id
      #パスワードが正しい場合、sessionの[:user_id]にユーザーのIDを入れ、user_pathへリダイレクト
      flash[:info] = "logged in as #{@user.name}"
      redirect_to @user
    else
      flash[:danger] = 'invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
