# frozen_string_literal: true

Rails.application.routes.draw do
  # Use to user session --------------------
  devise_for :users

  # Use to path app ------------------------
  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root 'home#index', as: :unauthenticated_root
    end
  end

  # Main Routes
  root to: 'home#index'

  # Home Routes
  match 'home', to: 'home#index', via: :get, as: :home
  match 'home/about', to: 'home#about', via: :get, as: :about

  # Resources
  resources :brands
  resources :newsletters
  resources :news, only: :index
  resources :leeds, only: %i[index create]
  resources :purchases, only: %i[index show]
  resources :customers, only: %i[index show], param: :uid
  resources :contacts, only: %i[index new create show destroy]

  resources :suggestions, except: :update do
    resources :reply_suggestions, only: :create
  end

  resources :users, only: %i[index show destroy] do
    resources :quotes, only: %i[index new create]
    resources :orders, only: %i[create destroy show update]
    resources :pets
  end
end
