Rails.application.routes.draw do
  namespace :admins_ativo do
    resources :admins
    resources :types
    resources :areas
    resources :subareas
    resources :conditions
    resources :situations
  end
  namespace :admins_ativo do
    get 'welcome/index'
  end
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'admins_ativo/welcome#index'
end
