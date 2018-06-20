Rails.application.routes.draw do
  # Create root route to be index action i.e. pics/index
  root 'pics#index'

  devise_for :users  

  get 'pics/index'

  resources :pics do 
    member do 
      put "like", to: "pics#upvote"
    end
  end  
  
end
