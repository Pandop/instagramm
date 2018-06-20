Rails.application.routes.draw do
  # Create root route to be index action i.e. pics/index
  root 'pics#index'

  get 'pics/index'

  resources :pics do 
  end

end
