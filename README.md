# README

This application is deployed to heroku [here](https://walkabilityscore.herokuapp.com/).

https://walkabilityscore.herokuapp.com/


To run this application locally:

Have ruby version 2.6.6 installed.

Clone the repo.

Run `bundle install` at the root level of the application.

The Radar API Key will need to be set in `config/application.yml` to make calls to the Radar API.

To generate a `config/application.yml` file, run the command:

```
bundle exec figaro install
```

and add the following to `config/application.yml`

```
RADAR_ENV_KEY: <A Radar Sever Side ENV Key>
```

This app has backend tests using RSpec.

To run specs:

```
rspec spec
```

To run the application run:

```
rails s
```

You may also need to create a database for the app.
If you already have Postgres installed run: 
```
rails db:setup
```
