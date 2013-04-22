#NEOreka!

This project aims to create a social network for those planet hunters who spend hours glued to those Barlows in search of little planets and NEOs. It's meant to promote discussion and vetting of new finds with the ultimate goal of giving that much-needed fast-forward to amateur planet-hunting.
It's mostly written in Ruby on Rails, with bits of JavaScript and CSS here and there.

NEOreka was made by [Awesoham](http://awesoham.wordpress.com).


To see how it works, visit our [development server](http://neoreka.herokuapp.com) or set the project up yourself.

##Setting the project up

* `git clone` the repo:
> `git clone https://github.com/Awesoham/NEOreka.git`

* Open the directory and run `bundle`
> `cd NEOreka && bundle`

* Setup the database (we use PostgreSQL as the default for Heroku compatibility)

    * To use SQLite as the default: edit `/.config/database.yml` and replace `gem 'pg'` in your `Gemfile`, in the `group :test` section, with: 
    > `gem 'sqlite3'`

    * Then replace all the text in `./config/database.yml` with this:
        ```development:
          adapter: sqlite3
          database: db/development.sqlite3
          pool: 5
          timeout: 5000

        test:
          adapter: sqlite3
          database: db/test.sqlite3
          pool: 5
          timeout: 5000

        production:
          adapter: sqlite3
          database: db/production.sqlite3
          pool: 5
          timeout: 5000```
          
* Run this:
    > `rake db:create db:schema:load`.

* Optionally create a few dummy users/NEOs (only works in development mode, experimental, amy not work!)
    > `rake db:populate users neos 500`

* Start the server!
    > `rails server`

* As they say, profit!
