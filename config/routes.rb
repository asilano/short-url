Rails.application.routes.draw do
  resources :shortened_urls
  devise_for :users

  root to: 'shortened_urls#index'
end
