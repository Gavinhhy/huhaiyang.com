Rails.application.routes.draw do

  get 'welcome/index'
  root 'welcome#index'

   resources :posts do
     collection do
     end
   end

end
