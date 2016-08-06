Rails.application.routes.draw do
  root 'welcome#home'

  devise_for :users
  get '/auth/facebook/callback' => 'sessions#create'

end
