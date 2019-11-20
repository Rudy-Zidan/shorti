Shorti::Engine.routes.draw do
  resources :shorten_urls, only: [:create]
end
