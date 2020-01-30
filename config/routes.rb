Rails.application.routes.draw do
  root to: 'groups#landing_page'
  resources :groups do
    resources :messages
  end

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

end
