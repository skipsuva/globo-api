Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: "pins#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users, except: [:new, :edit]
  resources :pins, except: [:new, :edit]
  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
