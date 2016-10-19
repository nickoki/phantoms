Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "posts#index"

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :phantoms

  resources :songs do
    # add routes to add and remove solo
    member do
      # Solos routes
      post 'add_solo'
      get 'edit_solo'
      put 'update_solo'
      delete 'remove_solo'

      # Arrangements Routes
      post 'add_arrangement'
      get 'edit_arrangement'
      put 'update_arrangement'
      delete 'remove_arrangement'
    end
  end

  resources :posts

end
