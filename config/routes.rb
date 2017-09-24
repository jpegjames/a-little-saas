Rails.application.routes.draw do

  # This does not need to be accessible in the production environment
  unless Rails.env.production?
    get 'demos/new', as: 'new_demo'
    post 'demos/create', as: 'demos'
  end

  get '/' => 'posts#index', as: 'root'
  resources :posts
  resources :comments, except: 'index'

  get 'login' => 'sessions#new', as: 'login'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy', as: 'logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
