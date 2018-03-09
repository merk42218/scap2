Rails.application.routes.draw do
  get 'stat/gra1'

  get 'stat/gra2'

  resources :users_roles
  resources :roles
  resources :my_users
  devise_for :users
  # get 'persons/profile'

  get 'emulator/generate1'

  get 'emulator/generate2'
  # get 'persons/profile', as: 'user_root'
  resources :characteristic_values
  resources :weights
  resources :part_of_characteristics
  resources :characteristics
  get 'welcome/index', as: :welcome

  resources :people
  resources :addresses
  resources :information_systems do
    collection do
      post :load_from_json_is
    end
  end
  root 'welcome#index'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
