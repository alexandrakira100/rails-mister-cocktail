Rails.application.routes.draw do
  root to:'cocktails#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :cocktails, except: :index do
  resources :doses, only: [ :new, :create ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 end
 resources :doses, only: [:destroy]
end
