Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: :api, defaults: { format: :json } do
    scope module: :v1 do
      # ユーザー関連
      namespace :users do
        resource :sign_in, only: [:create], controller: :sessions # users/sign_in
        resource :sign_out, only: [:destroy], controller: :sessions #users/sign_out
        resource :sign_up, only: [:create], controller: :registrations # users/sign_up

        resources :posts
      end
      # 投稿関連
      resources :posts
    end
  end
end
