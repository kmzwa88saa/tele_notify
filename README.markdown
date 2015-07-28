# TeleNotify

NOTE: Under development. None of these instructions are working yet.

## Installation

### Install

Just add the following to your Gemfile.

```ruby
gem 'tele_notify', '~> 0.1'
```

And follow that up with a ``bundle install``.

### Database Migrations and setup

TeleNotify uses a telegram_users table to store all users. To
generate and run the migration just use.

    rails generate tele_notify:migration
    rake db:migrate

Next, make your ApplicationController look like this:

```ruby
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #IMPORTANT! THESE TWO LINES MUST COME AFTER protect_from_forgery!
  skip_before_filter :verify_authenticity_token, :only => :webhook
  include TeleNotify::Controller

  #other code...
end
```

Last but not least, add a callback URL for telegram in ```config/routes.rb```, which must be the same as your token.

```ruby
Rails.application.routes.draw do
  post '/<your token>' => 'application#webhook'
end
```



## Testing

## Changes

## License

TeleNotify was initially forked from [Acts as votable](https://github.com/ryanto/acts_as_votable) by ryanto. It is released under the [MIT
License](http://www.opensource.org/licenses/MIT).
