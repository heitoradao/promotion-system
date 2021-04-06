Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'

  resources :promotions do
    member do
      post 'generate_coupons'
      post 'approve'
    end
    get 'search', on: :collection
  end

  resources :coupons, only: [] do
    post 'disable', on: :member
  end

  namespace :api do
    namespace :v1 do
      resources :coupons, only: [:show, :destroy]
    end
  end
end
