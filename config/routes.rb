Rails.application.routes.draw do
  resources :entries do
    collection { post :import }
  end

  root to: "entries#index"

  get 'welcome/index'
  root 'welcome#index'
end
