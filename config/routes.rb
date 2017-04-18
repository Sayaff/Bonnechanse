Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ru/ do
    resources :accessories
    resources :kits
    resources :fabrics
    resources :strands
    resources :patterns do
      collection do
        get 'by_date'
        get 'price_roubles'
        get 'price_dollars'
        get 'scenery'
        get 'portrait'
        get 'genre_scene'
        get 'still_life'
      end
    end
    devise_for :users

    resources :users

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

    resources :products

    root 'page#home'

    get 'page/home'

    get 'page/about'

    get 'page/faq'

    get 'page/contact'

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
