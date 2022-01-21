Rails.application.routes.draw do
  namespace :admins_ativo do
    resources :types
  end
  namespace :admins_ativo do
    get 'welcome/index'
  end
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'admins_ativo/welcome#index'
end
