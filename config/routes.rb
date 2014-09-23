CusfsLibrary::Application.routes.draw do

  root 'static_pages#home'
  match '/index', to: 'static_pages#home', via: 'get'
  match '/help', to: 'static_pages#help', 	via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/contact', to: 'static_pages#contact', 	via: 'get'
  match '/committee', to: 'static_pages#committee', via: 'get'
  match '/constitution', to: 'static_pages#constitution', via: 'get'
  match '/membership', to: 'static_pages#membership', via: 'get'
  match '/admin', to: 'static_pages#administration', via: 'get'
  match '/signin', to: 'sessions#new', 		via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/search', to: 'static_pages#search', via: [:get, :post], as: :search
  match '/checkout', to: 'withdrawals#new', via: 'get'

  match '/library', to: 'static_pages#library_home', via: 'get'
  match '/fiction', to: 'items#fiction', via: 'get'
  match '/graphic_novels', to: 'items#graphic_novels', via: 'get'
  match '/tie_ins', to: 'items#tie_ins', via: 'get'
  match '/tieins', to: 'items#tie_ins', via: 'get'
  match '/anthologies', to: 'items#anthologies', via: 'get'
  match '/nonfiction', to: 'items#nonfiction', via: 'get'
  match '/films', to: 'items#films', via: 'get'
  match '/games', to: 'items#games', via: 'get'

  match '/creative', to: 'creations#index', via: 'get'
  match '/ttba', to: 'creations#ttba', via: 'get'
  match '/chainwriting', to: 'creations#chainwriting', via: 'get'
  match '/art', to: 'creations#art', via: 'get'

  match '/schedule', to: 'events#index', via: 'get'
  match "/discussions", to: 'events#discussions', via: 'get'
  match "/screenings", to: 'events#screenings', via: 'get'
  match "/pub_meets", to: 'events#pub_meets', via: 'get'
  match "/speakers", to: 'events#speaker_events', via: 'get'
  match "/games_nights", to: 'events#games_nights', via: 'get'
  match "/cinema_trips", to: 'events#cinema_trips', via: 'get'

  resources :users do
    member do
      get :withdrawals
      get :collections
      get :reviews
      match 'renew', to: 'users#edit', via: 'get'
    end
  end
  resources :items do
    match "fiction", to: 'items#fiction', via: 'get'
    match "graphic_novels", to: 'items#graphic_novels', via: 'get'
    match "tie_ins", to: 'items#tie_ins', via: 'get'
    match "tieins", to: 'items#tie_ins', via: 'get'
    match "anthologies", to: 'items#anthologies', via: 'get'
    match "nonfiction", to: 'items#nonfiction', via: 'get'
    match "films", to: 'items#films', via: 'get'
    match "games", to: 'items#games', via: 'get'
    collection do
      match 'search' => 'items#search', via: [:get, :post], as: :search
    end
    member do
      get :withdrawals, :reviews, :collections
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :withdrawals, only: [:create, :destroy]
  resources :series, :authors, :reviews, :events, :creations, :withdrawals
  resources :exhibits, only: [:create, :destroy]
  resources :collections do
    member do
      get :items
    end
  end
end
