# frozen_string_literal: true

Rails.application.routes.draw do
  resources :employee_trainings
  resources :trainings
  resources :categories
  resources :employees
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post 'send_otp', to: 'users#send_otp'
  post 'verify_otp', to: 'users#verify_otp'

end
