# Shorti
A Shortener url gem for rails

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'shorti'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install shorti
```

Then install shorti:
```bash
$ rails g shorti:install
```

Then run migrations:
```bash
$ rails db:migrate
```

## Configuration
You will need to install [Ngrok](https://ngrok.com/) to test the app properly.
You can set the main domain for shorti by setting up an initializer "shorti.rb" in your app as the following:
/config/initializers/shorti.rb
```ruby
Shorti.setup do |config|
  # ngrok domain goes here.
  # if you are in production then it will be your own domain.
  config.domain = ENV['SHORTI_DOMAIN']
end
```
In development and test mode please set the following environment variables from "Ngrok" so you can work with url redirection fine:
```ruby
# ngrok domain or your real domain on production.
ENV['HOST']
```

You can set the Shorti routes in your routes.rb as the following:
```ruby
mount Shorti::Engine => "/"
```

## Project structure
- Controllers
  - ShortenUrlsController:
      Handle basic crud and redirection process.
- Presenters
  - BasePresenter:
    Parent class for any presenter.
  - NotFoundErrorPresenter:
      Handle 404 error presentation.
  - ValidationErrorPresenter:
      Handle validation errors "422" from models.
  - ShortenUrlCollectionPresenter:
      Handle presentation of shorten_urls with pagination meta data.
  - ShortenUrlPresenter:
      Handle presentation of single shorten_url.
- Services
  - BaseService:
      Parent class for any service.
  - CreateShortenUrlService:
      Handle creation process of shorten_url.
  - FindShortenUrlByIdService:
      Fetch shorten_url by id.
  - FindShortenUrlByUrlService:
      Fetch shorten_url by url.
  - GetAllShortenUrlService:
      Fetch collection of shorten_url and support pagination using [Pagy](https://github.com/ddnexus/pagy).
  - DestroyShortenUrlService:
      Delete shorten_url from DB.
- Models
  - ShortenUrl:
      Represent a shortened full url. Contains the following attributes("id", "original_url", "url", "created_at", "updated_at").

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
