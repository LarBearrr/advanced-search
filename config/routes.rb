Rails.application.routes.draw do
  mount Lockup::Engine, at: '/lockup'
  root 'welcome#index'
  post 'search' => 'welcome#search'
  get 'search' => redirect('/')
end
