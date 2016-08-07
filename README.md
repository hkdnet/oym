# Oym

Object yaml mapper.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'oym'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install oym

## Usage

Create your resource object to which you'd like to map your yaml.

```yaml
name: Dark Lord of Derkholm
author:
  name: Diana Wynne Jones
```

```ruby
class Author < Oym::Base # inherit Oym::Base
  attribute :name
end

class Book
  extend Oym::Resource # or just extend Oym::Resource
  attribute :name
  attribute :author, klass: Author
end
```

Then, call `from_yaml` with the yaml filepath.

```ruby
book = Book.from_yaml('path/to/yaml')
book.name # => Dark Lord of Derkholm
book.author.name #=> Diana Wynne Jones
book.author.is_a?(Author) #=> true
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hkdnet/oym.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

