Rails.application.routes.draw do
  resources :comments
  resources :stories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'stories#index'
end
