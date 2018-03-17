Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks",
                                    :registrations => "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "top#index"
  get 'about', to: 'top#about'
  resources :top, only: [:index] do
    resource :likes, only: [:create, :destroy]
  end
  resources :fukyos do
  	resources :comments
  	resource :likes, only: [:create, :destroy]
  end
  resources :odais do
    resource :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  

 
end
