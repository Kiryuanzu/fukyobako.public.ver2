Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "top#index"
  resources :top, only: [:index]
  resources :fukyos do
  	resources :comments
  	resource :likes, only: [:create, :destroy]
  end
  resources :odais
  resources :users, only: [:show, :edit, :update]
  get 'about', to: 'top#about'

 
end
