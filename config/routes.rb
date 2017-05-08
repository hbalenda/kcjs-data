Rails.application.routes.draw do
  resources :entries do
    collection { post :import }
  end
  get 'graph/index'
  root 'graph#index'
end
