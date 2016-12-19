Rails.application.routes.draw do
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes". 

  resources :users, only: [:index, :new] do 
    resources :campaigns, only: [:new, :create, :show, :edit, :update] do 
      resources :be_hero, only: [:new, :create] 

      resources :posts, only: [:new, :create, :show, :edit, :update, :destroy] do
        resources :comments, only: [:new, :create, :edit, :update, :destroy]
      end
      resources :goals, only: [:new, :create, :edit, :update, :destroy]
      resources :rewards, only: [:new, :create, :edit, :update]
      resources :rewards, only: [:new, :create, :edit, :update]
      resources :posts, only: [:new, :create, :edit, :update, :destroy] do
        resources :comments, only: [:new, :create, :edit, :update, :destroy]

      end
    end
    resources :profiles, only: [:show, :edit, :update]
    resources :streams, only: [:new, :create, :show, :delete] do
      resources :viewers, only: [:index]
    end
  end
  resources :featured, only: [:index, :show]
  resources :search, only: [:create, :index]
  resources :campaign_setup, only: [:new, :create]

  # You can have the root of your site routed with "root"
  match '/signout', :to => 'sessions#destroy', via: :delete
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  get '/posts/hashtag/:name', to:'posts#hashtags'

  post 'tokens' => "tokens#create"

  get 'home' => 'home#index'
  root 'home#index'


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
