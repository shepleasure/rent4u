Rails.application.routes.draw do

  get 'notifications/:id/link_through', to: 'notifications#link_through',
                                        as: :link_through
  
  get 'notifications', to: 'notifications#index'

  post 'verifications' => 'verifications#create'

  patch 'verifications' => 'verifications#verify'

  match '/verifications',    to: 'verifications#sendpin',    via: :get

  resources :listing_attachments
  devise_for :users, :controllers => { :registrations => "acme/registrations" }

  root 'categories#index'

  resources :categories, param: :name do
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