Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root 'books#top'
#   get 'top' => 'books#top'
  get 'show2' => 'users#show2'
#   get 'about' => 'books#about', as: 'home_about'
  get 'home/about' => 'books#about', as: 'home_about'

  resources :books, expect: [:new] do
     resource :favorites, only:[:create,:destroy]
  end
  patch 'books' => 'books#create'
  resources :users, only: [:show, :edit, :update, :index]

end
