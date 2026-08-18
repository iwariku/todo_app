Rails.application.routes.draw do
  devise_for :users
  get "sub_tasks/new"
  resources :tasks do
    resources :sub_tasks
  end
  root "home#index"
end
