recipes\_RoR
====================

## README for the Recipes application written in Ruby on Rails (with minimal magic)

* Author: Cindy Ward <cindyward@yahoo.com>
* Date created: September 4, 2014
* Last modification date: September 16, 2014
* Created for:  Epicodus, Summer 2014 session

## Included; written by author:
* ./README.md (this file)
* ./Gemfile (list of gems to be installed by bundler; please see below for more information)
* ./Gemfile.lock (list of gems and versions actually installed by bundler; please see below for more information)
* ./LICENSE.md (using the "Unlicense" template)
* ./Rakefile (configuration information used by 'rake' utility)
* ./app/assets/images/KidsCookingColor.jpg (downloaded from Web)
* ./app/assets/stylesheets/application.css.scss (modified by author)
* ./app/controllers/application\_controller.rb (modified by author)
* ./app/controllers/recipe\_users\_controller.rb
* ./app/controllers/recipes\_controller.rb
* ./app/controllers/tags\_controller.rb
* ./app/controllers/tried\_recipes\_controller.rb
* ./app/models/contributor.rb (the Ruby implementation of the Contributor model, child of User model)
* ./app/models/cook.rb (the Ruby implementation of the Cook model, child of User model)
* ./app/models/recipe.rb (the Ruby implementation of the Recipe model)
* ./app/models/recipe\_user.rb (the Ruby implementation of the RecipeUser model)
* ./app/models/recipes\_tab.rb (the Ruby implementation of the join table between Recipe and Tag models)
* ./app/models/tag.rb (the Ruby implementation of the Tag model)
* ./app/models/tried\_recipe.rb (the Ruby implementation of the join table between Cook and Recipe models)
* ./app/views/layouts/\_errors.html.erb (error partial form)
* ./app/views/layouts/application.html.erb (modified by author)
* ./app/views/recipe\_users/\_form1.html.erb (shared partial form)
* ./app/views/recipe\_users/\_form1a.html.erb (shared partial form)
* ./app/views/recipe\_users/\_form2.html.erb (shared partial form)
* ./app/views/recipe\_users/edit.html.erb
* ./app/views/recipe\_users/index.html.erb
* ./app/views/recipe\_users/login.html.erb
* ./app/views/recipe\_users/new.html.erb
* ./app/views/recipe\_users/show.html.erb
* ./app/views/recipes/\_form1.html.erb (shared partial form)
* ./app/views/recipes/\_form1d.html.erb (shared partial form)
* ./app/views/recipes/\_form2.html.erb (shared partial form)
* ./app/views/recipes/\_form2d.html.erb (shared partial form)
* ./app/views/recipes/\_form3.html.erb (shared partial form)
* ./app/views/recipes/\_form3d.html.erb (shared partial form)
* ./app/views/recipes/edit.html.erb
* ./app/views/recipes/index.html.erb
* ./app/views/recipes/new.html.erb
* ./app/views/recipes/show.html.erb
* ./app/views/tags/\_form.html.erb (shared partial form)
* ./app/views/tags/edit.html.erb
* ./app/views/tags/index.html.erb
* ./app/views/tags/new.html.erb
* ./app/views/tags/show.html.erb
* ./app/views/tried\_recipes/edit.html.erb
* ./app/views/tried\_recipes/index.html.erb
* ./app/views/tried\_recipes/new.html.erb
* ./config/routes.rb (the Rails routes for user action requests)
* ./db/config.yml (database configuration file showing the names of the development and test databases)
* ./db/schema.rb (database schema)
* ./db/migrate/*.rb (database migrations, which show the development of the database step-by-step. These are stored in the database as an additional table. The names are preceded by time stamps so they vary)
* ./spec/contributor\_spec.rb (the test spec for the Contributor class)
* ./spec/cook\_spec.rb (the test spec for the Contributor class)
* ./spec/recipe\_spec.rb (the test spec for the Contributor class)
* ./spec/spec\_helper.rb (utility code for opening database, loading required files, etc.)
* ./spec/tag\_spec.rb (the test spec for the Tag class)
* ./spec/tried\_recipe\_spec.rb (the test spec for the TriedRecipe join table class)

## Requirements for execution:
* [The Ruby language interpreter](https://www.ruby-lang.org/en/downloads/) must be installed. Please use version 2.1.2

* [git clone](http://github.com/) the image available at http://github.com/cindyward1/recipes\_RoR, which will create a recipes\_RoR directory with app, bin, config, db, lib, log, public, spec, tmp, and vendor directories

* [Homebrew](http://brew.sh/) is a package installer for Apple computers. To install homebrew, enter the following at a terminal application prompt **$: ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"**

* [PostgreSQL](http://http://www.postgresql.org/) is a SQL database package. To install PostgreSQL on an Apple computer, enter the following at a terminal application prompt **$: brew install postgres** . To configure PostgreSQL, enter the following commands at a terminal application prompt $:
 * **$: echo "export PGDATA=/usr/local/var/postgres" >> ~/.bash\_profile**
 * **$: echo "export PGHOST=/tmp" >> ~/.bash\_profile**
 * **$: source ~/.bash\_profile**
* To start the PostgreSQL server, enter the following at a terminal application prompt **$: postgres** . It is necessary to leave the window open for the server to continue to run. To create a database with the user's login name, enter the following at a teriminal application prompt **$: createdb $USER**

* [Bundler](http://bundler.io) tracks and installs the exact gems and versions that are needed. To install Bundler, enter the following at a terminal application prompt **$: gem install bundler**
* The following gems from http://rubygems.org will be automatically installed by entering the following at a terminal application prompt **$: bundle install**
 * [rails](https://rubygems.org/gems/rails) is a full-stack web framework. Please use Rails 4.1.5
 * [pg](https://rubygems.org/gems/pg) implements the Ruby interface to the PostgreSQL database
 * [bootstrap-sass](https://rubygems.org/gems/bootstrap-sass) implements the Ruby interface to Bootstrap (a popular HTML, CSS, and JS framework)
 * [sass-rails](https://rubygems.org/gems/sass-rails) is the SASS adapter for the Rails asset pipeline
 * [uglifier](https://rubygems.org/gems/uglifier) wraps UglifyJS to be accessible in Ruby
 * [jquery-rails](https://rubygems.org/gems/jquery-rails) provides jQuery and the jQuery-ujs driver for Rails
 * [turbolinks](https://rubygems.org/gems/turbolinks) makes following links in a Web application faster
 * [autoprefixer-rails](https://rubygems.org/gems/autoprefixer-rails) parses CSS and adds vendor prefixes to CSS rules using values from the 'Can I Use' Web site
 * (development configuration only) [better\_errors](https://rubygems.org/gems/better\_errors) provides a better error page for Rails and other Rack apps. Includes source code inspection, a live REPL and local/instance variable inspection for all stack frames
 * (development configuration only) [binding\_of\_caller](https://rubygems.org/gems/binding\_of\_caller) retrieve the binding of a method's caller; can also retrieve bindings even further up the stack
 * (development configuration only) [quiet\_assets](https://rubygems.org/gems/quiet\_assets) turns off Rails asset pipeline log
 * (development and test configurations only) [rspec-rails](https://rubygems.org/gems/rspec-rails) implements RSpec for Rails
 * (test configuration only) [rspec](https://rubygems.org/gems/rspec) is a testing tool for the Ruby language
 * (test configuration only) [shoulda-matchers](http://robots.thoughtbot.com/shoulda-matchers-2-6-0) "makes tests easy on the fingers and eyes" by simplifying the expression of rspec test conditions to be met
 * (production configuration only) [rails\_12factor](https://rubygems.org/gems/rails\_12factor) runs Rails the 12factor way

* To create the database, cd to (clone location)/recipes\_RoR and enter the following at a terminal application prompt **$: rake db:create** followed by **$: rake db:schema:load**

* To run the application takes several steps:
 * You must start the Rails server for the application to function at all. cd to (clone location)/recipes\_RoR and enter the following at a terminal application prompt **$: rails server . This window must stay open the entire time the application is running; it can be minimized.
 * After the Rails server is running, run the Chrome Web browser and enter **localhost:3000** in the Web address field. This should bring up the login screen. To create a new user, follow the "Register with Coolest Recipes" link near the bottom of the Web page.

* This application can be run from [Heroku](https://www.heroku.com/). To run from Heroku, you must first have Heroku installed (this is too complicated to explain in this README), login to Heroku with your credentials, then create the database by entering the following at a terminal application prompt **$: heroku run rake db:migrate** . This app can then be accessed from http://recipes-rubyonrails-cindy.herokuapp.com

* You can also test a non-interactive version of the methods against their test cases found in (clone location)/recipes\_RoR/spec/\*.rb using rspec (see gem reference above). Please use version 3.1.1. If you wish to do this, you must first cd to (clone location)/recipes\_RoR and enter the following at a terminal application **$: rake db:test:prepare** . This will prepare the test version of the database for use. Then to run rspec, cd to (clone location)/recipes\_RoR and enter the following string at a terminal application **$: rspec** (This command will automatically execute any .rb file it finds in ./spec/.)

* Please note that this repository has only been tested with [Google Chrome browser](http://www.google.com/intl/en/chrome/browser) version 36.0.1985.125 on an iMac running [Apple](http://www.apple.com) OS X version 10.9.4 (Mavericks). Execution on any other computing platform, browser or operating system is at the user's risk.

## Description:
This Ruby application implements a graphical user interface to a recipe management application. The user interface is divided into two parts depending on the user type: the actions a contributor user performs to create recipes and see the ratings of the recipes, and the actions a cook user performs to try and rate recipes.

### The recipe contributor is able to:
* Create a unique user name, a user password, and a screen name and have the date of the creation recorded. For the purposes of this very simple implementation, the password is not encrypted in the database. (This behavior is inherited from the RecipeUser model.)
* Log into the application and have their name and role (as the current user)displayed on each page. (This behavior is inherited from the RecipeUser model and uses the Ruby on Rails session information for data persistence.)
* Create new recipes to share with others. (Due to time constraints, a recipe is represented by only a title, the contributor user ID, the date contributed, the rating, and the number of ratings. There are no ingredients or instructions.)
* List all recipes and maintain the recipes they contributed. They can only view the recipes others contributed. Contributors cannot rate recipes.
* Create tags and tag the recipes they contributed.

### The cook is able to:
* Create a unique user name, a user password, and a screen name and have the date they joined recorded. For the purposes of this very simple implementation, the password is not encrypted in the database. (This behavior is inherited from the RecipeUser model.)
* Log into the application and have their name and role (as the current user)displayed on each page. (This behavior is inherited from the RecipeUser model and uses the Ruby on Rails session information for data persistence.)
* Choose a tag and see what recipes have that tag.
* Try a recipe and have the date of the trial recorded; see what recipes they have tried and when they tried them.
* Rate a recipe between 1 through 5 stars to share with others their opinion about it.
* See recipes ordered by the number of stars they have to focus on the best ones.

### Constraints and conditions:
* If a user wishes to be both a contributor and a cook, they must have 2 different user names (user names are unique for all users, whether contributors or cooks). This is a constraint because I used single-table inheritance rather than a more flexible mechanism to distinguish between the two types of users.

##Thanks:
* To my wonderful husband Steve Ward for his support and his incredible patience.
* To my little boy Pekingese Tiger (2/28/2001-9/2/2014) for sharing his life and his unconditional love with me.
