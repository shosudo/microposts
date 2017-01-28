class StaticPagesController < ApplicationController
#ApplicationControllerというクラスを継承しているため、アクションに対応したviewを表示可能となる。 
#ここで対応しているのは views/static_pages/home.html.erb
#Controllerの名前の最後の部分は複数形にする.

  def home
    @micropost = current_user.microposts.build if logged_in?
    #ログインしている場合は、新しい@micropostインスタンスを作成して、user_idと紐付けている
    #current_user.microposts.build = Micropost.new(user_id: current_user:id)
    @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc).page(params[:page]).per(10) if logged_in?
  end
  
end
