Rails.application.routes.draw do
  get '/' => 'home#top', as: 'root'
  get 'search' => 'search#show', as: 'search'
  devise_for :users
  resources :items
  resources :reviews, except: %i[index show]
  resources :manufacturers, only: %i[edit update destroy]
  resources :categories, only: %i[edit update destroy]
  resources :tags, only: %i[destroy]
  resources :comments, except: %i[index]
  resources :rooms, only: %i[index show create]
  resources :relationships, only: %i[create destroy]
  resources :comment_likes, only: %i[create destroy]
  resources :review_likes, only: %i[create destroy]
  resources :watched_items, only: %i[create destroy]
  resources :want_to_watch_items, only: %i[create destroy]
  resources :users, except: %i[index]
end
