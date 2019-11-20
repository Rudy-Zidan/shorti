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

## Configuration
You can set the main domain for shorti by setting up an initializer "shorti.rb" in your app as the following:
/config/initializers/shorti.rb
```ruby
Shorti.setup do |config|
  config.domain = ENV['SHORTI_DOMAIN']
end
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
