Rails.application.routes.draw do

  get '/' => 'central#index', as: :root

  resources :projects do
    resources :tasks
  end

  resources :users

  ## here be the guards
  get '/log-in' => "sessions#new"
  post '/log-in' => "sessions#create", as: :log_me_in
  get '/log-out' => "sessions#destroy", as: :log_me_out
end
