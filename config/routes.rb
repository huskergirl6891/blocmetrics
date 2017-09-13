Rails.application.routes.draw do
  resources :applications

  devise_for :users
  get 'welcome/index'

  root 'welcome#index'

end
