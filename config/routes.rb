Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "songs#index"

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :phantoms

  resources :songs do
    # add routes to add and remove solo
    member do
      # resources :solos
      post 'add_solo'
      get 'edit_solo'
      put 'update_solo'
      delete 'remove_solo'
    end
  end

end
