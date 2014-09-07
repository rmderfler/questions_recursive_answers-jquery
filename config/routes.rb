Rails.application.routes.draw do
  root to: 'questions#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'sessions/new'


  resources :sessions, :only => [:new, :create, :destroy] do
    resources :users
  end

  resources :users do
    resources :questions
  end

  resources :questions do
    resources :answers
  end


  resources :answers, :only => [:index, :show] do
    resources :answers
  end

end
