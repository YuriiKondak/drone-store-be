Rails.application.routes.draw do
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }

  namespace :users do
    get "/user", controller: :users, action: :user
  end

  resource :drones, only: [:show, :create, :update, :destroy]
  # ...
end
