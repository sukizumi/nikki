Rails.application.routes.draw do

  devise_scope :user do
    post 'users/guest/sign_in', to: 'public/sessions#guest_sign_in'
  end

  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'top' => 'homes#top', as: 'top'
    resources :posts, only: [:index, :show, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update, :destroy]
  end

  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root "homes#top"
    get "homes/about" => "homes#about", as: 'about'

    resources :posts, only: [:new, :index, :show, :create, :edit, :destroy, :update] do
      resource :likes, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end

    get "users/mypage" => "users#index", as: 'mypage'
    get "users/:id/information/edit" => "users#edit", as: 'edit_information'
    patch "users/:id" => "users#update", as: 'update_information'
    put "users/:id/information" => "users#update" 

    resources :users, only: [:show, :destroy] do
      resource :relationships, only: [:create, :destroy]

      member do
        get :likes
      end

      member do
        get :following, :follower
      end
    end
  end

  get "search" => "searches#search"


end
