# frozen_string_literal: true

Rails.application.routes.draw do
  resources :employee_trainings
  resources :trainings
  resources :categories
  resources :employees
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #write me a route with the conroller sepcified

  post 'send_otp', to: 'auth#send_otp'
  post 'verify_otp', to: 'auth#verify_otp'

end
