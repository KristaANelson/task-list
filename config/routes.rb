Rails.application.routes.draw do
  root to: "lists#index"
  resources :tasks
  resources :lists
  post "/archive-list"  => "lists#archive_list"
end
