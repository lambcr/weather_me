Rails.application.routes.draw do
  resources :alert_schedules, only: [:index, :show, :new, :create] do
    get :forecast, on: :member
  end

  devise_for :users
  get 'welcome/home'

  root 'alert_schedules#index'
end
