Myapp::Application.routes.draw do

  root :to => "tattoos#index"

  match 'about' => 'home#about'

  post '/change_to_artist' => 'users#change_to_artist'

  authenticated :user do
    root :to => 'tattoos#index'
  end

  devise_for :users #path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  resources :users

  match 'preview' => 'tattoos#preview'
  match 'quickpreview' => 'home#quickpreview'

  get 'search' => 'search#search'

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