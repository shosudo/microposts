class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.references :user, index: true, foreign_key: true
      #user_idという外部キーをカラムに追加。ユーザーと投稿を関連付け。
      #index:trueによって、user_idに対してindexを作成する。indexによってユーザーの投稿の高速な検索が可能に
      #foreign_key: trueによって、usersテーブルに存在するidのみuser=idに入るようにする
      t.text :content

      t.timestamps null: false
      t.index [:user_id, :created_at]
      #複合インデックス。作成時間で検索や並び替えを行う処理を早くする
    end
  end
end
