Rails.application.routes.draw do
  devise_for :users
 

  root "foods#index"

  resources :foods
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit]
  end

  
  devise_scope :user do 
    get '/users/sign_out' => 'devise/sessions#destroy' 
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
