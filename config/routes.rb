Rails.application.routes.draw do



  resources :stories do
    resources :comments#, only: []
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/index_admin', to: 'stories#index_admin'

  root 'stories#index'
end
