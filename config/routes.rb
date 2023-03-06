Rails.application.routes.draw do
  resources :users
  # TEM DIFERENÇA users e user como 'as: users'
  #get '/users', to: 'users#index', as: :users  # generates the path to the index action
  #get '/users/new', to: 'users#new', as: :new_user
  #post '/users', to: 'users#create', as: :create_user
  #get '/users/:id', to: 'users#show', as: :user
  #get '/users/:id/edit', to: 'users#edit', as: :edit_user
  #patch 'users/:id', to: 'users#update', as: :update_user
  #delete 'users/:id', to: 'users#destroy', as: :delete_user
  # So the syntax as: :user_path(user.id) is not valid. Instead, you can use a simple name for the named route, like user. 
  # The :as option will automatically create a named route with the _path suffix.

  # Por fim, para definir a URL é preciso entrar no arquivo routes.rb e, com o helper do Rails, todas ações padrões são mapeadas. 
  get 'sign_in' => 'sessions#new'
  post 'sign_in' => 'sessions#create' # to enter the system
  get 'sign_out' => 'sessions#destroy'
  root 'sessions#new'
  #new_photo_path  # generates the path to the new action
  #photo_path(:id)

end
