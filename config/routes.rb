Rails.application.routes.draw do
  namespace :site, path: ''  do
    resources :pages, only: [:index, :show]
    root 'pages#index'
  end


end
