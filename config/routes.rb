Myapp::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  post '/change_to_artist' => 'users#change_to_artist'

  get 'tattoos/most_liked' => 'tattoos#most_liked'


  authenticated :user do
    root :to => 'tattoos#index'
  end
  root :to => "home#index"
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  ActiveAdmin.routes(self)
  resources :users
  match 'preview' => 'tattoos#preview'
  get 'search' => 'search#search'
  match 'about' => 'home#about'
  match 'quickpreview' => 'home#quickpreview'
  resources :tattoos do
    resources :comments
    member do 
      post :vote_up
      post :vote_down
    end
  end

 
 resources :artists do
    resources :tattoos
    resources :comments
  end
  resources :artist_steps
   post '/artists/:artist_id/comments' => 'comments#create', as: 'create_comment'

end