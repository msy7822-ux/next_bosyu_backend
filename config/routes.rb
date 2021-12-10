require 'sidekiq/web'

Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'
  # graphql画面の表示
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: 'graphql#execute'
  end

  get '/users/myself', to: 'users#myself'
  get 'users/:id', to: 'users#name'
  resources :users
  resources :job_offer_slips, only: %i[create show]

  get '/mail_auth', to: 'mail_auth#redirect_top_page'

  get '/test', to: 'sessions#test'
  mount Sidekiq::Web => '/sidekiq'
end
