Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :articles
    get :setup, to: "setup#edit"
    post :setup, to: "setup#update"

    root to: 'articles#index'
  end

  get ":slug", to: "home#index"

  root to: 'home#index'
  resources :bloggers, path: "" do
    resources :articles, path: "" do
      resources :comments
    end
  end
end
