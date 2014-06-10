CusfsLibrary::Application.routes.draw do

  root 'static_pages#home'
  match '/help', to: 'static_pages#help', 	via: 'get'
  match '/committee', to: 'static_pages#committee', via: 'get'
  match '/contact', to: 'static_pages#contact', 	via: 'get'
  match '/signup', to: 'users#new', 		via: 'get'#
  match '/signin', to: 'sessions#new', 		via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  resources :items
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
