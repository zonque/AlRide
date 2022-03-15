[![Build Status](https://travis-ci.org/zonque/AlRide.svg?branch=master)](https://travis-ci.org/zonque/AlRide)

# AlRide - simple ride sharing platform

AlRide is a ride sharing platform that is as simple as is gets.

Anyone may enter ride offers and ride requests, and other people are able to contact
the submitter through a contact form. The email address is not shown to anyone on the
website, but only stored internally. The main view will only show database entries that
are in the future (minus some slack).

Each entry has a random secret assigned that is attached to a removal link which is added
to every mail that is sent to an entry submitter. This way, no user management, authentication
logic, role management or anything is needed.

Built with Rails 4.2, Bootstrap and HAML.

## Installing

### Self-hosting

AlRide is a standard Rails 4 application. You can pretty much follow any of the available install guides, or follow the one below.

Basically, to get started you need git, ruby (>= 2.0) and the bundler gem, then follow these steps.

1) Clone the repository

    git clone git://github.com/zonque/AlRide.git

2) cd into the directory

    cd AlRide

3) Install all necessary gems:

    bundle install

If you want to use `sqlite` in your `production` environment, make sure to add `gem 'sqlite'` to the `production` group of
`Gemfile` before running the `bundle` command.

4) Create and modify settings:

    cp config/settings/template.yml config/settings.local.yml

In particular, make sure to set the secret token for your application in the settings. `rake secret` will generate one for you.

5) Create and setup the database

    rake db:setup

6) Precompile assets (only needed for production)

    rake assets:precompile

7) Start the server

To start AlRide in the development environment simply run

    bundle exec rails server

To start AlRide in the production environment make sure you
did not skip step 6 and run:

    rails server -e production

(Note that for a "real" production environment you should really use something like unicorn or passenger.)

Navigate to http://localhost:3000/ to use AlRide.

### Configuration through environment variables

Environment variables can be used to override settings passed in YAML files such as `config/settings.local.yml`.
Keys must be prefixed with `ALRIDE` and the nesting separator is `__`. So for example, in order to set the platform name,
you would set the environment variable `ALRIDE__platform_name` prior to starting the application server.

### Heroku

Alternative to host AlRide on your own hardware, you can host AlRide on [Heroku](https://heroku.com). To make this even quicker, click on the button below:

[![Deploy To Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

That will setup everything on heroku, all you'll need to provide is the application name and URL.

## Customize

The page header on the default welcome screen can be customized by putting Markdown formatted content into a file called `config/page_header.<I18n>.md`,
where `<I18n>` is one of the supported locale variables (`en`, `de`, ...).

If such a files doesn't exist, the configured platform name is shown instead.

## Contribute

To contribute, please clone the project and send pull requests through GitHub.

## License

All code in this repository is released under the [GNU Affero General Public License](https://www.gnu.org/licenses/agpl-3.0.en.html) unless explicitly stated differently. Please refer to the `LICENSE` file for more detailed information.

### TODO

* Add more localizations

* Fix bugs listed in the issue tracker of the GitHub project
