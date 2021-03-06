Rails.application.routes.draw do

  # resources :authentications

  # match 'auth/:provider/callback', to: 'authentications#create', via: [:get, :post]
  # match 'auth/failure', to: redirect('/'), via: [:get, :post]

  get 'auth/:provider/callback', to: 'sessions#createfb'
  get 'auth/failure', to: redirect('/')  
  get 'logout', to: 'sessions#destroyfb'
  resources :sessions, only: [:create, :destroy]
  get 'messages/index'

  get 'notifications/index'

  get 'comments/index'

  get 'comments/new'

  get 'log_times/index'

  get 'time_log/index'

  root              'static_pages#home'

  get  'help'    => 'static_pages#help'
  get  'about'   => 'static_pages#about'
  get  'contact' => 'static_pages#contact'
  get  'signup'  => 'users#new'
  get  'login'   => 'sessions#new'
  post 'login'   => 'sessions#create'
  delete 'logout'=> 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :microposts do 
    resources :comments 
    member do 
      get 'like', to: "microposts#like"
      get 'unlike', to: "microposts#unlike"
    end
  end
  resources :likeables, only: [:create, :destroy]
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :relationships, only: [:create, :destroy]
  resources :templates
  resources :steps
  resources :log_times, only: [:index, :destroy]
  resources :notifications, only: [:index, :destroy]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
