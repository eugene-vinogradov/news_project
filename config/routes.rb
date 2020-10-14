# frozen_string_literal: true

Rails.application.routes.draw do
  root 'base_pages#home'
  get 'home',      to: 'base_pages#home'
  get 'about',     to: 'base_pages#about'
  get 'contacts',  to: 'base_pages#contacts'
  get 'help',      to: 'base_pages#help'

  get '/login',    to: 'sessions#new'
  post 'login',    to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get '/signup',   to: 'users#new'
  resources        :users

  resources        :feeds

  # patch '/update/:id', to: 'feeds#update'
  # For details on the DSL available within this file,
  # see https://guides.rubyonrails.org/routing.html
end
