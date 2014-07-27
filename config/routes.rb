CusfsLibrary::Application.routes.draw do

  get "series/index"
  get "series/view"
  root 'static_pages#home'
  match '/help', to: 'static_pages#help', 	via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/contact', to: 'static_pages#contact', 	via: 'get'
  match '/signup', to: 'users#new', 		via: 'get'#
  match '/signin', to: 'sessions#new', 		via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  resources :users do
    member do
      get :withdrawals
    end
  end
  resources :items do
    member do
      get :withdrawals
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :withdrawals, only: [:create, :destroy]
  resources :series
end
