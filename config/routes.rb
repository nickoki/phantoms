Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "songs#index"

  devise_for :users

  resources :songs do
    # add routes to add and remove solo
    member do
      # resources :solos
      get 'add_solo' # TODO why are these GET requests?
      get 'edit_solo'
      # put 'update_solo'
      get 'remove_solo'
    end
  end

end
