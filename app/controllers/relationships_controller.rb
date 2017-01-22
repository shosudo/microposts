class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find(params[:followed_id])
    #フォローするユーザーのIDをパラメータとして受けとり、
    current_user.follow(@user)
    #見つかったユーザーを引数としてUserモデルのfollow methodを実行
  end

  def destroy
    @user = current_user.following_relationships.find(params[:id]).followed
    current_user.unfollow(@user)
  end
  
end
