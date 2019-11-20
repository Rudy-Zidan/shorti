Shorti::Engine.routes.draw do
  resources :shorten_urls, only: [:show, :create]
end
