Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  resources :posts, only: %i[index new create] do
    resources :comments, only: [:create]
  end

  resources :follows, only: [:index]
  post 'follows/:id', to: 'follows#create', as: 'follow_user'
  delete 'follows/:id', to: 'follows#destroy', as: 'unfollow_user'
end
