Rails.application.routes.draw do

  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'top' => 'homes#top', as: 'top'
    resources :posts, only: [:index, :show, :edit, :update]
    resources :users, only: [:index, :show, :edit, :update]
  end

  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root "homes#top"
    get "homes/about" => "homes#about", as: 'about'

    resources :posts, only: [:new, :index, :show, :create, :edit, :destroy, :update] do
      resources :likes, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end

    get "users/mypage" => "users#index", as: 'mypage'
    get "users/:id/information/edit" => "users#edit", as: 'edit_information'
    patch "users/:id" => "users#update", as: 'update_information'
    put "users/:id/information" => "users#update" 
    resources :users, only: [:show, :destroy]
    #resources :users do
      #resource :relationships, only: [:create, :destroy]
      #get 'following' => 'relationships#following', as: 'following'
      #get 'follower' => 'relationships#follower', as: 'follower'
    #end
  end

  get "search" => "searches#search"


end
