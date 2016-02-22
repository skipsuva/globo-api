Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [:new, :edit]
  resources :pins, except: [:new, :edit]
  # DEFINE PATCH
  # match 'pins/:id' => "pins#update", via: :options
  resources :places, except: [:new, :edit]
  resources :destinations, except: [:new, :edit]
  resources :trips, except: [:new, :edit]

  post "/users/sign_in", to: "sessions#create"
  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
