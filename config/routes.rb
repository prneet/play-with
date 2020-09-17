Rails.application.routes.draw do
  root to: 'recruits#index'
  resources :recruits do
    collection do
      get 'search'
    end
  end
  get 'recruit_with_pass/:id', to: 'recruits#recruit_with_pass'
  post 'recruit_with_pass/:id', to: 'recruits#authenticate'
end
