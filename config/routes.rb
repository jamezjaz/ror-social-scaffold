Rails.application.routes.draw do
  root 'posts#index'
  # get 'update', to: 'friendships#update', as: :update_friendship

  devise_for :users

  resources :users, only: %i[index show] do
  resources :friendships, only: %i[new create destroy update]
  end
  resources :posts, only: %i[index create] do
    resources :comments, only: %i[create]
    resources :likes, only: %i[create destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
