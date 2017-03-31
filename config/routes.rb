Rails.application.routes.draw do


  #resource :usuario
  #get '/usuario', to: "usuarios#index"

  resources :usuario, controller: 'usuarios', defaults: { format: :json }

  resources :usuarios, format: :json #defaults: { format: :json }
  resources :stories do
    resources :comments#, only: []
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/index_admin', to: 'stories#index_admin'

  post '/usuario/:id', to: 'usuarios#update'
  put '/usuario', to: 'usuarios#create'
  #post 'post/:id' => 'posts#create_comment'

  root 'stories#index'
end
