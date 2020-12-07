# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'signup', to: 'users#create'
  post 'sessions', to: 'user_tokens#create'

  get 'profile', to: 'users#show'

end
