Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  namespace :site, path: ''  do
    resources :pages, only: [:index, :show]
    root 'pages#index'
  end

  namespace :admin do
    resources :sessions, only: [:new, :create]
    delete 'sign_out' => 'sessions#destroy', as: :sign_out

    resources :menus
    resources :pages
    resources :categories

    resources :catalogs do
      resources :products
    end

    resources :photos, only: [:create, :update, :destroy]
    root 'catalogs#index'
  end

  root 'pages#index'
end
