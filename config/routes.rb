Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'admin/places#index'

  namespace :admin do
  	resources :places
  end
  namespace :admin do
  	resources :users
  end

  resources :places, only: [:index, :show]

  namespace :user do
  	resources :users
  end
  namespace :user do
  	resources :places
  
  end
end
