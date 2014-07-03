Rails.application.routes.draw do
  devise_for :users
  get 'welcome/home'

  root 'welcome#home'
end
