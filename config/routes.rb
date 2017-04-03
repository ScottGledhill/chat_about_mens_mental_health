Rails.application.routes.draw do
  devise_for :users
  root to: "chat_rooms#index"
  resources :chat_rooms, only: [:new, :create, :show, :index]
  mount ActionCable.server => '/cable'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
