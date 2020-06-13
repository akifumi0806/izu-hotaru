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
  	resources :users, only: [:show, :update, :destroy]
  end
  namespace :user do
  	resources :places do
      resources :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end
  get 'user/users/withdraw' => 'user/users#withdraw'
  get '/homes/top' => 'homes#top'
  get '/homes/about' => 'homes#about'
end
