class StaticPagesController < ApplicationController
#ApplicationControllerというクラスを継承しているため、アクションに対応したviewを表示可能となる。 
#ここで対応しているのは views/static_pages/home.html.erb
#Controllerの名前の最後の部分は複数形にする.

  def home
  end
  
end
