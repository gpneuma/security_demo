SecurityDemo::Application.routes.draw do
  match '/signup', to: 'users#new', :via => :get
  match '/signup', to: 'users#create', :via => :post, :as => :post_signup
  match '/login', to: 'sessions#new', :via => :get
  match '/login', to: 'sessions#create', :via => :post, :as => :post_session
  match '/logout', to: 'sessions#destroy'
  resources :users, :except => [:new, :create]
  resources :sessions, :only => [:destroy]

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  root :to => 'community#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
