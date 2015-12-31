Rails.application.routes.draw do

  root 'categories#index'

  resources :categories do
  	resources :subcategories
  end

  resources :listings
  
  match '/help',    to: 'pages#help',    via: :get
  match '/term',    to: 'pages#term',    via: :get
  match '/privacy', to: 'pages#privacy', via: :get
  match '/about',   to: 'pages#about',   via: :get
  match '/contact', to: 'pages#contact', via: :get

end