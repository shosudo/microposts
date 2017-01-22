module SessionsHelper
#ヘルパーはモデルの情報を受け取って表示用の出力（HTMLタグの表示、テキストの出力）を行うメソッドを入れるモジュール
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
        #current_user method はsessionのuser idにcookieが入ってた場合ログイン済みとみなす
        #||=は左の値がnilかfalseの場合右の値(user_id)を代入する
        #find_by methodはUserが見つからない場合はnilを返す
        #method最後の値が代入文の場合、代入文を実行した後の左の値を返すため、current_user methodは@current_userを返す
        #||=で代入を行っているため、@current_userに既に値が入っている場合は、右側の処理は実行されずDBにアクセスする必要が無い
    end
    
    def logged_in?
        !!current_user
        #!!xxxx は右側に続く値が存在する場合はtrueを存在しない場合はfalseを返す
    end
    
    def store_location
        session[:forwarding_url] = request.url if request.get?
        #requestがGETの場合、session[:forwarding_url]にrequest urlを代入
        #ログインが必要なページにアクセスした際、ログイン後に再びリダイレクトさせる際にこのmethodを使う
    end
end