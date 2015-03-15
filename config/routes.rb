Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  namespace :site, path: ''  do
    resources :pages, only: [:index, :show]
    resources :catalogs, only: [:index, :show], path: 'catalog'

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

    resources :product_templates do
      resources :product_template_options, as: :options
    end


    resources :photos, only: [:create, :update, :destroy]
    root 'catalogs#index'
  end

  root 'pages#index'
end
