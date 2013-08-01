Myapp::Application.routes.draw do
  


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :users
  match 'search' => 'tattoos#search'
  resources :tattoos do
    resources :comments
    member do 
      post :vote_up
      post :vote_down
    end
  end

end