Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  mount API::Base => '/api'

end
