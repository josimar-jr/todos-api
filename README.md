# todos-api
tutorial para api com ruby on rails

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



running the TEST commands
```
bundle install
rails generate rspec:install
mkdir spec/factories
rails db:migrate
rake db:test:prepare
bundle exec rspec
```

