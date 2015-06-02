Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  #API routes
  namespace :v1, constraints: { subdomain: 'api'} do
    resources :dics
    post 'login', to: 'users#login'
    post 'sign_up', to: 'users#sign_up'
    delete 'logout', to: 'users#logout'
  end
end
