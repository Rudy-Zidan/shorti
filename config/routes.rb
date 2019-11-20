Shorti::Engine.routes.draw do
  resources :shorten_urls, only: [:index, :show, :create, :destroy]

  # handle shorten_url redirection to its original url
  get '/:url', action: :redirect, controller: :shorten_urls
end
