Aua::Application.routes.draw do


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'survey#index'
   get 'admin' => 'admin#index', :format => false
   get 'admin/index' => 'admin#index', :format => false
   get 'admin/login' => 'admin#login', :format => false
   post 'admin/login_process' => 'admin#login_process', :format => false
   get 'admin/logout' => 'admin#logout', :format => false
   post 'admin/content_up/:id' => 'admin#content_up', :format => false
   get 'admin/result/:id' => 'admin#result', :format => false
   get 'admin/destroy_survey/:id' => 'admin#destroy_survey', :format => false
   get 'admin/new_survey/:id' => 'admin#new_survey', :format => false
   post 'admin/new_process' => 'admin#new_process', :format => false
   post 'admin/image_change/:id' => 'admin#image_change', :format => false
   post 'admin/edit_box/:id' => 'admin#edit_box', :format => false
   post 'admin/edit_example/:id' => 'admin#edit_example', :format => false
   post 'admin/delete_example/:id' => 'admin#delete_example', :format => false
   post 'admin/add_example/:id' => 'admin#add_example, :format => false'
   post 'admin/add_box/:id' => 'admin#add_box', :format => false
   post 'admin/add_paragraph/:id' => 'admin#add_paragraph', :format => false
   get 'admin/edit_survey/:id' => 'admin#edit_survey', :format => false
   get 'admin/delete_box/:id' => 'admin#delete_box'


   get 'survey/index' => 'survey#index', :format => false
   get 'survey/profile/:id' => 'survey#profile', :format => false
   post 'survey/profile_process/:id' => 'survey#profile_process', :format => false
   get 'survey/view/:id' => 'survey#view', :format => false
   post 'survey/submit_process/:id' => 'survey#submit_process', :format => false

   get 'survey/complete' => 'survey#complete', :format => false




  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
end
