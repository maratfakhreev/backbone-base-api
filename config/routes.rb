Rails.application.routes.draw do
  scope defaults: { format: :json } do
    devise_for :users, only: []
  end

  namespace :v1, defaults: { format: "json" } do
    resources :dashboard, only: %i(index)
    resources :articles, except: %i(new edit update)
    resources :comments, only: %i(create)

    devise_scope :user do
      post "users/sign_in", to: 'sessions#create'
    end

    post "users/sign_up", to: 'registrations#create'
  end
end
