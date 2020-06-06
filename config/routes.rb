Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  devise_for :stores, controllers: {
    sessions:      'stores/sessions',
    passwords:     'stores/passwords',
    registrations: 'stores/registrations'
  }
  root "top#index"
  resources :users, only: [:edit, :update]
  resources :stores, only: [:edit, :update]
  resources :groups, only: [:new, :create]
  get 'messages/index'
  get 'helps/index'
end
