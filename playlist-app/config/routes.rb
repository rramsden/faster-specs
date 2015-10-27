Rails.application.routes.draw do
  resources :playlists
  devise_for :users

  root "playlists#index"
end
