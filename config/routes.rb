Rails.application.routes.draw do
  devise_for :users
  root 'events#index'
  resources :users, only: [:show, :index]
  resources :events do 
    member do
      get 'invitation'
      get 'cancel_invitation'
    end
  end
end
