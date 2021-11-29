require 'sidekiq/web'

Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'
  # graphql画面の表示
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: 'graphql#execute'
  end
  
  resources :users
  
  ## Twitter login
  post '/login', to: 'sessions#login'
  # delete '/logout', to: 'sessions#logout'
  # get '/auth/:provider/callback', to: 'sessions#twitter'
  
  post '/test', to: 'sessions#test'
  mount Sidekiq::Web => '/sidekiq'
end
