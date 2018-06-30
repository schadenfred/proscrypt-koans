Rails.application.routes.draw do

  devise_for :users
  get 'static/home'
  root 'static#home'

end
