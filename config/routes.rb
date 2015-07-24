Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  get 'welcome/index'
  root 'welcome#index'

   resources :posts do
     collection do
     end
   end

end
