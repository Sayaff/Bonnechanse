Rails.application.routes.draw do

  resources :admin, only: [:index] do
    collection do
      get :discount_category_select
      get :discount_patterns
      get :discount_active_patterns
      get :no_discount_patterns
    end
  end

  resources :admin_notifications, only: [:index, :destroy] do
    member do
      get :mark_as_read
    end
    collection do
      get :clear_all
      get :mark_as_unread #for testing purposes, delete later
    end
  end

  scope "(:locale)", locale: /en|ru/ do
    resources :accessories
    resources :kits
    resources :fabrics
    resources :strands
    resources :patterns do
      member do
        get 'cancel_discount'
      end
      collection do
        get 'by_date'
        get 'price_roubles'
        get 'price_dollars'
        get 'scenery'
        get 'portrait'
        get 'genre_scene'
        get 'still_life'
        get 'discount_active'
        post 'set_discount'
        patch 'apply_discount'
        get 'reset_discount'
      end
    end

    devise_for :users, controllers: { confirmations: 'confirmations', registrations: 'registrations', sessions: 'sessions'}

    resources :users, only: [:index, :edit, :show, :update]

    resources :carts do
      member do
        get :confirm_order
        get :place_order
        get :buy_for_yourself
        get :buy_as_present
        get :cart_info
        get :switch_to_placed
        get :switch_to_delivered
        get :switch_to_cancelled
      end
      collection do
        get :my_orders
      end
    end

    resources :cart_items do
      member do
          post 'create_pattern'
          post 'create_strand'
          post 'create_fabric'
          post 'create_kit'
          post 'create_accessory'
          get 'quantity_increase'
          delete 'quantity_decrease'
      end
      collection do
          get 'clear_cart'
      end
    end

    root 'page#home'

    get 'page/home'
    get 'page/about'
    get 'page/faq'
    get 'page/contact'
    post 'page/global_search'

    get 'application/set_currency', as: :set_currency

  end

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
