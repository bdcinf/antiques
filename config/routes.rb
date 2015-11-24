Antiques::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root :to => "product_categories#index"

  resources :products do
    put :add_to_cart
    delete :remove_from_cart
  end
  resources :product_categories do
    resources :product_subcategories do
      resources :products
    end
  end

  get "/contact_us" => "product_categories#contact_us"
  post "/contact_us" => "product_categories#contact_us"
  get "/terms" => "product_categories#terms"
  get "/faq" => "product_categories#faq"
  get "/privacy_policy" => "product_categories#privacy_policy"
  get "/businesses" => "product_categories#businesses"
  get "/about_us" => "product_categories#about_us"
  post "/product_category/send_email" => "product_categories#send_email"

  get "/product_subcategory/:id" => "product_subcategories#show"
  get "/product_subsubcategory/:id" => "product_subsubcategories#show"
  resource :admin do
    get :admin_info
  end

  delete "/admins/delete_slider/:id" => "admins#delete_slider"
  get "/admins/show_slider" => "admins#show_slider"

  get "/update_subcat" => "admins#update_subcat"
  get "/update_subsubcat" => "admins#update_subsubcat"
  get "/update_subcat_for_subcat_lvl_1" => "admins#update_subcat_for_subcat_lvl_1"

  delete "/admins/delete/:id" => "admins#delete"

  get "/admins/show_categories" => "admins#show_categories"
  get "/admins/new_category" => "admins#new_category"
  get "/admins/create_category" => "admins#create_category"
  get "/admins/edit_category" => "admins#edit_category"
  put "/admins/update_category" => "admins#update_category"
  delete "/admins/delete_category/:id" => "admins#delete_category"

  get "/admins/show_subcategories/:id" => "admins#show_subcategories"
  get "/admins/new_subcategory" => "admins#new_subcategory"
  get "/admins/create_subcategory" => "admins#create_subcategory"
  get "/admins/edit_subcategory" => "admins#edit_subcategory"
  put "/admins/update_subcategory" => "admins#update_subcategory"
  delete "/admins/delete_subcategory/:id" => "admins#delete_subcategory"

  get "/admins/show_subsubcategories/:id" => "admins#show_subsubcategories"
  get "/admins/new_subsubcategory" => "admins#new_subsubcategory"
  get "/admins/create_subsubcategory" => "admins#create_subsubcategory"
  get "/admins/edit_subsubcategory" => "admins#edit_subsubcategory"
  put "/admins/update_subsubcategory" => "admins#update_subsubcategory"
  delete "/admins/delete_subsubcategory/:id" => "admins#delete_subsubcategory"
  

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
  get ':controller(/:action(/:id(.:format)))'
  post ':controller(/:action(/:id(.:format)))'
end
