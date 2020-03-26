Rails.application.routes.draw do
  require 'sidekiq/prometheus/exporter'
  mount Sidekiq::Prometheus::Exporter => '/metrics'
  resources :books
  root 'common#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
