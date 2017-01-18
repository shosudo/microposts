Rails.application.routes.draw do

  root to: 'static_pages#home'
  #app/views/static_pages/home.html.erbがTOPに表示されるように
  #Original is get 'static_pages/home'

  get 'signup',  to: 'users#new'
  #If you access /signup with Get method, do Users_controller's new action.
  
  resources :users
  #resources method はリソースの操作を可能にするURLを生成する
  #url is /users. action is depends on HTTP method.
  #Please use command 'rake routes' if you want to check route list. 

end
