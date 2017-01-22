class User < ActiveRecord::Base
#model's name is always singular and start from upper case letter
#ActiveRecord::Baseというクラスを継承することで、DBのTableを利用可能

    before_save { self.email = self.email.downcase }
    #emailを小文字に変更。before_saveはコールバックと呼ばれ、データの保存が行われる前にmethodを実行
        validates :name, presence: true, length: { in: 2..20 }
        VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
        #emailの正規表現パターンを定義
        validates :email, presence: true, length: { in: 2..255 },
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }
        #指定した正規表現パターンに一致するかvalidate

    has_secure_password
    #Userモデルに下記の機能を追加
    #1.DBにハッシュ化されたpassword_digestを保存
    #2.passwordとpassword_confirmationをモデルに追加し、パスワードの確認が一致するか検証する
    #3.パスワードが正しい時に、ユーザーを返すauthenticate methodを提供する

    validates :address, presence: true, length: { maximum: 100 } , on: :update
    validates :profile, presence: true, length: { maximum: 100 } , on: :update
    
    has_many :microposts
    #投稿に紐付いている。複数の投稿が1ユーザーに紐づく。
    has_many :following_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
    #user.following_relationshipsでuserがフォローしているrelationshipの集まりを取得. follower_idとfollowed_id(user_id)の関連.
    has_many :following_users, through: :following_relationships, source: :followed
    #following_relationships経由で、フォローしているユーザーの集まりを取得。
    has_many :follower_relationships, class_name:  "Relationship", foreign_key: "followed_id", dependent: :destroy
    #userがフォローされているrelationshipの集まりを取得
    has_many :follower_users, through: :follower_relationships, source: :follower
    #userがフォローされているユーザーの集まりを取得
    
    # 他のユーザーをフォローする
    def follow(other_user)
        following_relationships.find_or_create_by(followed_id: other_user.id)
        #find_or_create_by methodは因数のパラメータと一致するものを一見取得し、存在する場合はそのオブジェクトを返し、ない場合は作成し保存する
    end
    
    # フォローしているユーザーをアンフォローする
    def unfollow(other_user)
        following_relationship = following_relationships.find_by(followed_id: other_user.id)
        following_relationship.destroy if following_relationship
    end
    
    # あるユーザーをフォローしているかどうか？
    def following?(other_user)
        following_users.include?(other_user)
    end
end
