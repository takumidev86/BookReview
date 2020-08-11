Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'books#top'
  get 'top' => 'books#top'
  get 'show2' => 'users#show2'
  get 'about' => 'books#about', as: 'home_about'
  resources :books, expect: [:new]
  patch 'books' => 'books#create'
  resources :users, only: [:show, :edit, :update, :index]
end
