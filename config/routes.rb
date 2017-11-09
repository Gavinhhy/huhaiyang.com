Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  get 'welcome/index'
  root 'welcome#index'

  get "sign_up" => "users#sign_up", :as => "sign_up"
  #resource :users, only: [:create]

  resources :users do
    collection do
      get 'sign_up'
    end
  end

  resources :posts do
     collection do
       get :posts_in_2017
       get :posts_in_2016
       get :posts_in_2015
       get :posts_in_2014
     end
  end


end
