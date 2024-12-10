# FactoryBotGenerator


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'factory_bot_generator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install factory_bot_generator

## Usage

```ruby

user = User.first

puts FactoryBotGenerator::Base.render(user)
puts FactoryBotGenerator::Base.render(user, { name: :first_user })
puts FactoryBotGenerator::Base.render(user, { exclude: [:password, :last_name, :ssn] })

```



## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
