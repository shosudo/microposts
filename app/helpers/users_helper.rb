module UsersHelper
#ヘルパーはモデルの情報を受け取って表示用の出力（HTMLタグの表示、テキストの出力）を行うメソッドを入れるモジュール
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    #メールアドレスからGravatarの画像用のURLを生成
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
    #<img>タグを出力
  end
end