Rails.application.routes.draw do

  resources :listing_attachments
  devise_for :users
  root 'categories#index'

  resources :categories do
  	resources :subcategories
  end

  resources :listings do
    collection do
      get 'search_main'
      get 'search'
      get 'autocomplete'
    end
    resources :reviews, except: [:show, :index]
  end

  
  match '/help',    to: 'pages#help',    via: :get
  match '/term',    to: 'pages#term',    via: :get
  match '/privacy', to: 'pages#privacy', via: :get
  match '/about',   to: 'pages#about',   via: :get
  match '/contact', to: 'pages#contact', via: :get
  match '/subcategories/find_by_category', to: 'subcategories#find_by_category', via: :post
  match '/mylistings', to: 'listings#mylistings', via: :get

end