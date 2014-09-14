recipes\_RoR
====================

## README for the Recipes application written in Ruby on Rails (with minimal magic)

* Author: Cindy Ward <cindyward@yahoo.com>
* Date created: September 4, 2014
* Last modification date: September 4, 2014
* Created for:  Epicodus, Summer 2014 session

## Included; written by author:
* ./README.md (this file)
* ./Gemfile (list of gems to be installed by bundler; please see below for more information)
* ./Gemfile.lock (list of gems and versions actually installed by bundler; please see below for more information)
* ./LICENSE.md (using the "Unlicense" template)
* ./Rakefile (configuration information used by 'rake' utility)
* ./recipes_menu.rb (main application file)
* ./app/controllers/recipes_controller.rb
* ./app/controllers/tags_controller.rb
* ./app/controllers/users_controller.rb
* ./app/models/contributor.rb (the Ruby implementation of the Contributor model, child of User model)
* ./app/models/cook.rb (the Ruby implementation of the Cook model, child of User model)
* ./app/models/ingredient.rb (the Ruby implementation of the Ingredient model, used solely by Recipe model)
* ./app/models/ingredients_recipe.rb (the Ruby implementation of the join table between Ingredient and Recipe models)
* ./app/models/instruction.rb (the Ruby implementation of the Instruction model, used solely by Recipe model)
* ./app/models/instructions_recipe.rb (the Ruby implementation of the join table between Instruction and Recipe models)
* ./app/models/recipe.rb (the Ruby implementation of the Recipe model)
* ./app/models/recipes_tab.rb (the Ruby implementation of the join table between Recipe and Tag models)
* ./app/models/tag.rb (the Ruby implementation of the Tag model)
* ./app/models/tried_recipe.rb (the Ruby implementation of the join table between Cook and Recipe models)
* ./app/models/user.rb (the Ruby implementation of the User model, parent to Contributor and Cook models)
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
* [The Ruby language interpreter](https://www.ruby-lang.org/en/downloads/) must be installed. Please use version 2.1.2.

* [git clone](http://github.com/) the image available at http://github.com/cindyward1/recipes\_RoR, which will create a recipes\_RoR directory with app, bin, config, db, lib, log, public, spec, tmp, and vendor directories.

* [Homebrew](http://brew.sh/) is a package installer for Apple computers. To install homebrew, enter the following at a terminal application prompt **$: ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"**

* [PostgreSQL](http://http://www.postgresql.org/) is a SQL database package. To install PostgreSQL on an Apple computer, enter the following at a terminal application prompt **$: brew install postgres** . To configure PostgreSQL, enter the following commands at a terminal application prompt $:
 * **$: echo "export PGDATA=/usr/local/var/postgres" >> ~/.bash\_profile**
 * **$: echo "export PGHOST=/tmp" >> ~/.bash\_profile**
 * **$: source ~/.bash\_profile**
* To start the PostgreSQL server, enter the following at a terminal application prompt **$: postgres** . It is necessary to leave the window open for the server to continue to run. To create a database with the user's login name, enter the following at a teriminal application prompt **$: createdb $USER**

* [Bundler](http://bundler.io) tracks and installs the exact gems and versions that are needed. To install Bundler, enter the following at a terminal application prompt **$: gem install bundler**
* The following gems from http://rubygems.org will be automatically installed by entering the following at a terminal application prompt **$: bundle install**
 * [activerecord](https://rubygems.org/gems/activerecord) maps database tables to Ruby classes
 * [pg](https://rubygems.org/gems/pg) implements the Ruby interface to the PostgreSQL database
 * [rake](https://rubygems.org/gems/rake) controls the generation of executables and other non-source files from a program's source files
 * [active\_record\_migrations](https://rubygems.org/gems/active\_record\_migrations) allows the use of Active Record migrations in non-Rails projects
 * [titleize](bygems.org/gems/titleize) adds String#titleize for creating properly capitalized titles (used for recipe names)
 * (test configuration only) [rspec](https://rubygems.org/gems/rspec) is a testing tool for the Ruby language.
 * (test configuration only) [shoulda-matchers](http://robots.thoughtbot.com/shoulda-matchers-2-6-0) "makes tests easy on the fingers and eyes" by simplifying the expression of rspec test conditions to be met.

* To create the database, cd to (clone location)/recipes\_RoR and enter enter the following at a terminal application prompt **$: rake db:create** followed by **$: rake db:schema:load**

* To run the application, cd to (clone location)/recipes\_RoR and enter the following at a terminal application prompt **$: ruby recipes_menu.rb**
* You can also test a non-interactive version of the methods against their test cases found in (clone location)/recipes\_RoR/spec/\*.rb using rspec (see gem reference above). Please use version 3.1.1. If you wish to do this, you must first cd to (clone location)/recipes\_RoR and enter the following at a terminal application **$: rake db:test:prepare** . This will prepare the test version of the database for use. Then to run rspec, cd to (clone location)/recipes\_RoR and enter the following string at a terminal application **$: rspec** (This command will automatically execute any .rb file it finds in ./spec/.)

* Please note that this repository has only been tested with [Google Chrome browser](http://www.google.com/intl/en/chrome/browser) version 36.0.1985.125 on an iMac running [Apple](http://www.apple.com) OS X version 10.9.4 (Mavericks). Execution on any other computing platform, browser or operating system is at the user's risk.

## Description:
This Ruby application implements a graphical user interface to a recipe management application. The user interface is divided into two parts depending on the user type: the actions a contributor user performs to create recipes and see statistics about the recipes that have been tried, and the actions a cook user performs to try and rate recipes.

### The recipe contributor is able to:
* Create a unique user name, a user password, and a screen name and have the date of the creation recorded. For the purposes of this very simple implementation, the password is not encrypted in the database. (This behavior is inherited from the User model.)
* Create new recipes to share with others.
* List and maintain posted recipes.
* Tag recipes so they are easier to find.

### The cook is able to:
* Create a unique user name, a user password, and a screen name and have the date they joined recorded. For the purposes of this very simple implementation, the password is not encrypted in the database. (This behavior is inherited from the User model.)
* Choose a tag and see what recipes have that tag.
* Try a recipe and have the date of the trial recorded.
* Rate a recipe between 0 through 5 stars to share with others their opinion about it.
* See recipes ordered by the number of stars they have to focus on the best ones.
* Search through recipes to find something with a particular ingredient or word.

### Constraints and conditions:
* If a user wishes to be both a contributor and a cook, they must have 2 different user names (user names are unique for all users, whether contributors or cooks). This is a constraint because I used single-table inheritance rather than a more flexible mechanism to distinguish between the two types of users.
* There is no need for a tags#read route because the sole content of a tag is its text, which is fully displayed in the tags#list route. Thus clicking on a tag in the list of all tags goes to the tags#edit and the redirect from tags#update and tags#destroy is to tags#list.

##Thanks:
* To my wonderful husband Steve Ward for his support and his incredible patience.
* To my little boy Pekingese Tiger (2/28/2001-9/2/2014) for sharing his life and his unconditional love with me.
