Rails.application.routes.draw do


  get '/auth/:provider/callback', :to => 'sessions#create'
  get '/auth/failure', to: 'sessions#failure'
  delete '/auth/signout', to: 'sessions#destroy'

  get '/mrt' => 'pages#mrt'
  get '/restaurant' => 'pages#restaurant'
  get '/' => "pages#index"
  get '/user' => "users#show"
  post '/users/mapinfo.js.erb' => "users#mapinfo"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'pages#index'
   resources :posts


  scope :path => '/api/v1/', :module => "api_v1", :defaults => { :format => :json }, :as => 'v1' do

    #resources :restaurants
    post "/restaurants" => "restaurants#index" # GET /restaurants
    post "/favorite_get" => "restaurants#favorite_get" # GET /favorites

    post "/visit" => "restaurants#visit"    # PUT /visits/:restaurant_id
    post "/no_visit" => "restaurants#no_visit" # DELETE /visit/:restaurant_id
    post "/visit_get" => "restaurants#visit_get" # GET /visits/:restaurant_id

    post "/favorite_like" => "restaurants#favorite_like" # PUT /favorites/:restaurant_id?status=like
    post "/favorite_dislike" => "restaurants#favorite_dislike" # PUT /favorites/:restaurant_id?status=dislike
    post "/favorite_no_more" => "restaurants#favorite_no_more" # # PUT /favorites/:restaurant_id?status=waiting

    post "/login" => "auth#login"
    #post "/logout" => "auth#logout"


     #####resources :restaurants
  end

  # scope :path => '/api/v2/', :module => "api_v2", :defaults => { :format => :json }, :as => 'v2' do

  #   GET "/restaurants" => "restaurants#index"
  #   GET "/favorites" => "restaurants#favorite_get"

  #   PUT "/visits/:restaurant_id" => "restaurants#visit"
  #   DELETE "/visit/:restaurant_id" => "restaurants#no_visit"
  #   GET "/visits/:restaurant_id" => "restaurants#visit_get"

  #   PUT "/favorites/:restaurant_id?status=like" => "restaurants#favorite_like"
  #   PUT "/favorites/:restaurant_id?status=dislike" => "restaurants#favorite_dislike"
  #   PUT "/favorites/:restaurant_id?status=waiting" => "restaurants#favorite_no_more"

  #   post "/login" => "auth#login"

  # end

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
