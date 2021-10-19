Rails.application.routes.draw do
  resources :tasks, only: [:create, :new]

  root to: "tasks#new"
end
