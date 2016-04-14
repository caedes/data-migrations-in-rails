# Data Migrations in Rails - Example Project

[bit.ly/data-migrations-in-rails](http://bit.ly/data-migrations-in-rails)

## Getting Started

Clone `git` repository:

```shell
git clone https://github.com/caedes/data-migrations-in-rails.git
```

Setup the app:

```shell
./bin/setup
```

## Demonstration

### Data Modification in Migration

```shell
gco data-migration-file
rake db:migrate
```

```ruby
User.all.size
#=> ~50000
```

### Not So Smart Rake Task

```shell
gco data-rake-task-file
rake -T
```

Some issues:

1. Doesn't display task when running `rake -T`;
2. Rake goes through every single record;
3. Invokes validations/callbacks;
4. Uses condition to check if a user needs to be updated or not;
5. Doesn't give us a indication that it is actually working.

### Smart One

```ruby
namespace :adhoc do
  namespace :users do
    desc "Fill up users that have both first and last names"
    task fill_up: :environment do
      users = User.where "users.first_name IS NOT NULL AND users.last_name IS NOT NULL"
      puts "Update #{users.count} users..."

      ActiveRecord::Base.transaction do
        users.update_all filled_at: Time.current
      end

      puts "done."
    end
  end
end
```
