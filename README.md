## Prepare project:

* `bundle install`
* `cp config/database.yml.example config/database.yml` and edit it
* `bundle exec rake db:create`
* `bundle exec rake db:migrate`

## Run

`bundle exec guard`

## Requirements

* Ruby `>= 2.0.0`
