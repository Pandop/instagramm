Rails.application.routes.draw do
  devise_for :users
  # Create root route to be index action i.e. pics/index
  root 'pics#index'

  get 'pics/index'

  resources :pics
end
