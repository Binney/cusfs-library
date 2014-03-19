CusfsLibrary::Application.routes.draw do

  get "items/new"
  root 'static_pages#home'
  match '/help', to: 'static_pages#help', via: 'get'
  match '/committee', to: 'static_pages#committee', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'

end
