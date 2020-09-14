Rails.application.routes.draw do
  root to: 'recruits#index'
  resources :recruits
  get 'recruit_with_pass/:id', to: 'recruits#recruit_with_pass'
  post 'recruit_with_pass/:id', to: 'recruits#authenticate'
end
