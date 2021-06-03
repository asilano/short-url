Rails.application.routes.draw do
  resources :shortened_urls
  devise_for :users

  root to: 'shortened_urls#index'

  get ':short_form', to: 'shortened_urls#visit'
end
