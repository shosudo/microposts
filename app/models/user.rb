class User < ActiveRecord::Base
#model's name is always singular and start from upper case letter
#ActiveRecord::Baseというクラスを継承することで、DBのTableを利用可能

    before_save { self.email = self.email.downcase }
    #emailを小文字に変更。before_saveはコールバックと呼ばれ、データの保存が行われる前にmethodを実行
        validates :name, presence: true, length: { maximum: 50 }
        VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
        #emailの正規表現パターンを定義
        validates :email, presence: true, length: { maximum: 255 },
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }
        #指定した正規表現パターンに一致するかvalidate

    has_secure_password
    #Userモデルに下記の機能を追加
    #1.DBにハッシュ化されたpassword_digestを保存
    #2.passwordとpassword_confirmationをモデルに追加し、パスワードの確認が一致するか検証する
    #3.パスワードが正しい時に、ユーザーを返すauthenticate methodを提供する

end
