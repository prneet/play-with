Rails.application.routes.draw do
  root to: 'recruits#index'
  resources :recruits
end
