Rails.application.routes.draw do
  resources :applications

  devise_for :users
  get 'welcome/index'

  root 'welcome#index'

  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end
end
