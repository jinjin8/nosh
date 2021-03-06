Rails.application.routes.draw do
  root to: 'services#index'

  resources :services do
    resources :reviews, except: [:show, :index]
  end
# routes for user auth
  resources :users, except: [:edit, :update]
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

# admin routes
  get '/admin' => 'services#admin'
end
