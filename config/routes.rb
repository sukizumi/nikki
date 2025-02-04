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

    resources :posts, only: [:new, :index, :show, :create, :edit, :destroy, :update] do
      resources :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end

    get "users/mypage" => "users#show", as: 'mypage'
    get "users/information/edit" => "users#edit", as: 'edit_info'
    patch "users/information" => "users#update", as: 'update_info'
    delete "users/destroy" => "users#destroy"
    resources :users do
      resource :relationships, only: [:create, :destroy]
      get 'following' => 'relationships#following', as: 'following'
    end
  end

end
