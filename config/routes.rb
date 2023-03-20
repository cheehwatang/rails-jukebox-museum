Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  
  resources :jukeboxes, only: %i[show]

  get '/auth/spotify/callback', to: 'users#spotify'
end
