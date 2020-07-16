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
  resources :users, only: [:index, :edit, :update]
  resources :stores, only: [:edit, :update,:show]
  resources :groups, only: [:index,:new, :create, :edit, :update] do
    resources :messages, only: [:index, :create]

    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
  end
  resources :helplists, only: [:index, :new, :create, :destroy, :edit] do
    collection do
      get 'search'
    end
  end
end