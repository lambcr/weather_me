Rails.application.routes.draw do
  resources :alert_schedules

  devise_for :users
  get 'welcome/home'

  root 'alert_schedules#index'
end
