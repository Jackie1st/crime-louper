Rails.application.routes.draw do
  resources :locations
  devise_for :users, controllers: {registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "locations#index"
end
