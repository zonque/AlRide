# AlRide - simple ride sharing platform

AlRide is a ride sharing platform that is a simple as is gets.

Anyone may enter ride offers and ride requests, and other people are able to contact
the submitter through a contact form. The email address is not shown to anyone on the
website, but only stored internally. The main view will only show database entries that
are in the future (minus some slack).

Each entry has a random secret assigned that is attached to a removal link which is added
to every mail that is sent to an entry submitter. This way, no user management, authentication
logic, role management or anything is needed.

Built with Rails 4, Bootstrap and HAML.

## Installing

AlRide is a standard Rails 4 application. You can pretty much follow any of the available install guides, or follow the one below.

Basically, to get started you need git, ruby (>= 2.0) and the bundler gem, then follow these steps.

1) Clone the repository

    git clone git://github.com/zonque/AlRide.git

2) cd into the directory

    cd AlRide

3) Install all necessary gems:

    bundle install

4) Create and modify settings:

    cp config/settings.yml.template config/settings.yml

5) Create and setup the database

    rake db:setup

6) Precompile assets (only needed for production)

    rake assets:precompile

7) Generate secret token and add the generated token into `config/initializers/secret_token.rb`

    rake secret
    cp config/initializers/secret_token.rb.example config/initializers/secret_token.rb

8) Start the server

To start frab in the development environment simply run

    bundle exec rails server

To start frab in the production environment make sure you
did not skip step 6 and run:

    rails server -e production

(Note that for a "real" production environment you should really use something like unicorn or passenger.)

Navigate to http://localhost:3000/ to use AlRide.

## Contribute

To contribute, please clone the project and send pull requests through GitHub.

### TODO

* Add more localizations

* Fix bugs listed in the issue tracker of the GitHub project

