# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  namespace 'api' do
    namespace 'v1' do
      root 'home#index'

      resources :users
      resources :sessions, only: %i[new create destroy]

      get 'signup', to: 'users#new', as: 'signup'
      get 'login', to: 'sessions#new', as: 'login'
      get 'logout', to: 'sessions#destroy', as: 'logout'
      # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
      resources :resumes
    end
  end
end
