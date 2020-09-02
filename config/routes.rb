Rails.application.routes.draw do
  get '/' => 'home#top', as: 'root'

end
