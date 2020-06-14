require 'sidekiq/web'

Rails.application.routes.draw do

  # get 'process-files', to: 'process_files#home'
  # get 'process-files/new', to: 'process_files#create'
  # post 'process-files', to: 'process_files#store'

  get '/process-files', to: 'process_files#home', as: :process_files_home
  get '/process-files/new', to: 'process_files#create', as: :process_files_create
  post '/process-files/store', to: 'process_files#store', as: :process_files_store

  devise_for :users, :controllers => { registrations: 'registrations' }
  mount Sidekiq::Web => '/sidekiq'
end
