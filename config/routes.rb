Rails.application.routes.draw do
  resources :tasks
  resources :lists
  root to: "lists#index"
  get "/archived-lists"  => "lists#archived_lists"
  post "/delete_file"    => "tasks#delete_file"
  get "/add_file"        => "tasks#add_file"
  put "/update_file"     => "tasks#update_file"
end
