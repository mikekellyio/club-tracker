Rails.application.routes.draw do

  resources :sections, only: [:show, :edit, :update, :destroy] do
    resources :sub_sections, shallow: true
  end

  resources :books do
    resources :sections, only: [:index, :new, :create]
  end

  resources :children do
    resources :completed_sections, except: :update
  end

  resources :clubs do
    resources :teams
  end

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  root to: "home#index"
end
