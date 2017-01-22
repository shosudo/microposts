class Micropost < ActiveRecord::Base
  belongs_to :user
  #userに関連付けされている。それぞれの投稿は1ユーザーに紐づく。
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
