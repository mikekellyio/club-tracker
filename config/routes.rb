Rails.application.routes.draw do
  resources :sub_sections

  resources :sections

  resources :books

  resources :children

  resources :teams

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  root to: "home#index"
end
