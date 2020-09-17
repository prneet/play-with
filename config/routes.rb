Rails.application.routes.draw do
  root to: 'recruits#index'
  resources :recruits do
    collection do
      get 'search'
    end
  end
  get 'delete_with_pass/:id', to: 'recruits#delete_with_pass', as: 'delete_recg'
  post 'delete_with_pass/:id', to: 'recruits#destroy', as: 'delete_recp'
end
