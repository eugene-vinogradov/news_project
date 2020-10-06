Rails.application.routes.draw do
  get 'users/new'
  root 'base_pages#home'
  get 'home', to: 'base_pages#home'
  get 'about', to: 'base_pages#about'
  get 'contacts', to: 'base_pages#contacts'
  get 'help', to: 'base_pages#help'
  get '/signup', to: 'users#new'
  # For details on the DSL available within this file,
  # see https://guides.rubyonrails.org/routing.html
end
