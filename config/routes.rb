Rails.application.routes.draw do
  get '/' => 'home#top', as: 'root'
  devise_for :users
  get 'users/show'

end
