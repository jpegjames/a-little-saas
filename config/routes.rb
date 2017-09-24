Rails.application.routes.draw do
  get '/' => 'posts#index', as: 'root'
  resources :posts
  resources :comments, except: 'index'

  get 'login' => 'sessions#new', as: 'login'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy', as: 'logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
