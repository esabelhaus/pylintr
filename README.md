# Pylintr

Ruby wrapper for Pylint: https://github.com/PyCQA/pylint

* The intention of this gem is to provide an easier way to consume the output from pylint
* It provides the output from pylint in an array format

## Installation

Add this line to your application's Gemfile:

    `gem 'pylintr'`

And then execute:

    `$ bundle install`

Or install it yourself as

    `$ gem install pylintr`

## Usage

* By default it uses the pylint predefined configuration

```ruby
  Pylintr.lint(content)         #=> [[message, line], ...]
  Pylintr.file_lint(file_path)  #=> [[message, line], ...]
```

* If you would like to use a custom configuration

```ruby
  lint = Pylintr.new(config_content)
  lint.lint(content)          #=> [[message, line], ...]
```

## Contributing

1. Fork it ( http://github.com/esabelhaus/pylintr/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
