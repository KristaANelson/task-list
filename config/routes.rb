Rails.application.routes.draw do
  root to: "lists#index"
  resources :tasks
  resources :lists
  get "/archived-lists"  => "lists#archived_lists"
end
