Rails.application.routes.draw do
  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'users/register' => 'users#create'
      put 'users/:id' => 'users#update'
      post 'auth/login' => 'sessions#login'
      delete 'auth/logout' => 'sessions#logout'
    end
  end

end
