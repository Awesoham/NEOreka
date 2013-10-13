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

* Setup the database:

    * To use PostgeSQL as the default: edit `/.config/database.yml`, and don't forget to replace `gem 'sqlite3'` in your `Gemfile`, in the `group :test` section, with: 
    
        > `gem 'pg'`
          
* Run this:
    > `rake db:create db:schema:load`.

* Optionally create a few dummy users/NEOs (only works in development mode, experimental, may not work!)
    > `rake db:populate users neos 500`

* Start the server!
    > `rails server`

* As they say, profit!
