GlamTrends::Application.routes.draw do
  
  get "sport_centres/index"
  get "sport_centres/delete"
  get "sport_centres/edit"
  get "sport_centres/new"
  get "sport_centres/show"
  get "salons/index"
  get "salons/delete"
  get "salons/edit"
  get "salons/new"
  get "salons/show"
  get "spas/index"
  get "spas/delete"
  get "spas/edit"
  get "spas/new"
  get "spas/show"
  get "gyms/index"
  get "gyms/delete"
  get "gyms/edit"
  get "gyms/new"
  get "gyms/show"
  root 'users#sign_in'
  match ':controller(/:action(/:id))', :via => [:get, :post]
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
