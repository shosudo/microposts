class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create]
    #application_controllerのlogged_in_user methodでログインしていない場合は/loginにリダイレクト

    def create
        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save
            flash[:success] = "メッセージは保存されました"
            redirect_to root_url
        else
            render 'static_pages/home'
        end
    end
    
    def destroy
        @micropost = current_user.microposts.find_by(id: params[:id])
        #投稿がユーザーのものでない場合はルートへリダイレクト
        return redirect_to root_url if @micropost.nil?
        @micropost.destroy
        flash[:success] = "投稿を削除しました"
        redirect_to request.referrer || root_url
        #referrerへ遷移
    end
    
    private
    
    def micropost_params
        params.require(:micropost).permit(:content)
    end
    
end
