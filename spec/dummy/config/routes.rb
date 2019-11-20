Rails.application.routes.draw do
  # Set shorti routes on app level
  mount Shorti::Engine => "/"
end
