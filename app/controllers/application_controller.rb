class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  #Sessionshelper moduleを全体読み込み
  
  private
  def logged_in_user
  #Application controllerで定義されているので全体に適応される
    unless logged_in?
    #loginしていない場合
      store_location
      #URLを保存
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
  end
end
