Rails.application.routes.draw do
  get "tasks/new", to: "tasks#new", as: :new_task
  post "tasks", to: "tasks#create", as: :tasks
  root "home#index"
end
