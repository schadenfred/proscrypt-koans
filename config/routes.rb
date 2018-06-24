Rails.application.routes.draw do

  get 'static/home'
  get 'static/about'
  get 'static/contact'
  get 'static/terms'
  get 'static/privacy'
  get 'static/help'

  devise_for :users

  root 'static#home'
end
