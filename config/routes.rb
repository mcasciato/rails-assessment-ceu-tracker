Rails.application.routes.draw do
  root 'welcome#home'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'users/registrations' }

  resources :users do
    resources :ceus, only: [:show, :new, :edit]
  end
    resources :ceus
    resources :notes
end
