Rails.application.routes.draw do
  root 'welcome#home'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'users/registrations' }

  resources :users do
    resources :ceus
  end
  # resources :ceus, only: [:show, :create, :edit, :update, :destroy]
  resources :notes, only: [:index, :create, :edit, :update, :destroy]

end
