[![AYPEX::Emails CI](https://github.com/aypex-io/aypex-emails/actions/workflows/ci.yml/badge.svg)](https://github.com/aypex-io/aypex-emails/actions/workflows/ci.yml)
[![Standard RB](https://github.com/aypex-io/aypex-emails/actions/workflows/standard_rb_core.yml/badge.svg)](https://github.com/aypex-io/aypex-emails/actions/workflows/standard_rb_core.yml)

# Aypex::Emails

## Usage
How to use my plugin.

## Installation

Create a new rails app
```bash
rails new [app_name] --database=postgresql -a propshaft
```

Add this line to your application's Gemfile:

```ruby
gem "aypex"
gem "aypex-emails"
```

And then execute:
```bash
bundle
```

```bash
bin/rails g aypex:emails:install
```

## Testing

```bash
bundle exec rake test_app
```

```bash
bundle exec rspec spec
```

## License
The gem is available as open source under the terms of the [MIT License](https://github.com/aypex-io/aypex-emails/blob/main/MIT-LICENSE).
