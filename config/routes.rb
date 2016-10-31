Rails.application.routes.draw do
  root to: "posts#index"
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :phantoms
  # NHO: at this point it might be easier to do nested resources for solos + arrangements,
  #  with seperate controllers for each, but no views. Could provide more flexibility as you
  # build out rather than adding to one big controller

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
