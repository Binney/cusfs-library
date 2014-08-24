CusfsLibrary::Application.routes.draw do

  root 'static_pages#home'
  match '/help', to: 'static_pages#help', 	via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/contact', to: 'static_pages#contact', 	via: 'get'
  match '/signup', to: 'users#new', 		via: 'get'#
  match '/signin', to: 'sessions#new', 		via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  match "fiction", to: 'items#fiction', via: 'get'
  match "graphic_novels", to: 'items#graphic_novels', via: 'get'
  match "tie_ins", to: 'items#tie_ins', via: 'get'
  match "anthologies", to: 'items#anthologies', via: 'get'
  match "nonfiction", to: 'items#nonfiction', via: 'get'
  match "films", to: 'items#films', via: 'get'
  match "games", to: 'items#games', via: 'get'

  resources :users do
    member do
      get :withdrawals
      get :reviews
    end
  end
  resources :items do
    member do
      get :withdrawals, :reviews, :collections
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :withdrawals, only: [:create, :destroy]
  resources :series, :authors, :reviews
  resources :exhibits, only: [:create, :destroy]
  resources :collections do
    member do
      get :items
    end
  end
end
