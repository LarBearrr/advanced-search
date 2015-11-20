Rails.application.routes.draw do
  root 'welcome#index'
  post 'query' => 'welcome#query'
end
