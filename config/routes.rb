Rails.application.routes.draw do
  mount Lockup::Engine, at: '/lockup'
  root 'welcome#index'
  post 'query' => 'welcome#query'
end
