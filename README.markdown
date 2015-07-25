# TeleNotify

TeleNotify description

## Installation

### Install

Just add the following to your Gemfile.

```ruby
gem 'tele_notify', '~> 0.0.1'
```

And follow that up with a ``bundle install``.

### Database Migrations

TeleNotify uses a votes table to store all voting information.  To
generate and run the migration just use.

    rails generate tele_notify:migration
    rake db:migrate

## Testing

## Changes

## License

Acts as votable is released under the [MIT
License](http://www.opensource.org/licenses/MIT).
