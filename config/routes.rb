Rails.application.routes.draw do
  get 'products/index'
  get 'products/search'
  root 'products#index'
  get 'products/search'
end
