Gamebook::Application.routes.draw do
 
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

  

  scope '/:locale' do
    devise_for :users
    devise_for :profiles

    get '/' => 'welcome#index', as: 'home'

    namespace :admin do
      # Directs /admin/pages/* to Admin::PagesController
      # (app/controllers/admin/pages_controller.rb)
      get '/' => 'admin#index'

      resources :pages
    end

    get 'profiles/me' => 'profiles#show', as: :me
    resources :profiles, only: [:show, :edit, :update]

    # Index : all books
    # Show : One books
    resources :store, only: [:index, :show]

    resources :books, only: [:show]

    resources :bookmaking
    

    scope '/bookmaking' do
      # Book
      get '/:id/publish' => 'bookmaking#publish', as: :publish_bookmaking
      # Chapter
      #get '/chapter/:id' => 'bookmaking#show_chapter', as: :show_chapter_bookmaking
      get '/book/:id/chapter/new' => 'bookmaking#new_chapter', as: :new_chapter_bookmaking
      post '/:id' => 'bookmaking#create_chapter', as: :create_chapter_bookmaking
      get '/chapter/:id/edit' => 'bookmaking#edit_chapter', as: :edit_chapter_bookmaking
      put '/:id' => 'bookmaking#update_chapter', as: :update_chapter_bookmaking
      delete '/chapter/:id/destroy' => 'bookmaking#destroy_chapter', as: :destroy_chapter_bookmaking
    end

    resources :my_library, only: [:index, :edit, :update]
  end



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
