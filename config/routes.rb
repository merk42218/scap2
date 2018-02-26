Rails.application.routes.draw do
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
