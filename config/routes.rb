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
    get '/places/map' => '/admin/places#map'
    get '/places/searcharea' => '/admin/places#searcharea'
  	resources :places
  	resources :users
  end

  resources :places, only: [:index, :show]

  namespace :user do
  	resources :users, only: [:show, :update, :destroy]
    
  end
  namespace :user do
    get '/places/map' => '/user/places#map'
  	resources :places do
      resources :favorites, only: [:create]
      delete 'favorites' => 'favorites#destroy'
      resources :comments, only: [:create, :destroy]
      resources :coupons, only: [:index, :create, :show]
    end
  end
  get 'user/users/withdraw' => 'user/users#withdraw'
  get '/homes/top' => 'homes#top'
  get '/homes/about' => 'homes#about'
  get '/homes/attention' => 'homes#attention'

  devise_scope :user do #簡単ログイン用
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
end
