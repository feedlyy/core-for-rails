# HOW TO INSTALL

##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.6.5p114]
- Rails [6.0.2.1]

##### 1. Check out the repository

```bash
git clone https://github.com/feedlyy/core-for-rails.git
```

##### 2. Install all dependencies

```bash
bundle install
```

##### 3. Create and setup the database

```ruby
rake db:create
rake db:setup
```

If you using postgresql, add this to database.yml

```bash
default: 
port: 5432 (your db port)
username: postgres (your username for postgre)
password: postgres (your password for postgre)

and change database name in your development, test or 
production 
```

migrate your migration

```ruby
rake db:migrate
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000

##### Extra

For authentication, i'm currently using knock (https://github.com/nsarno/knock)

go to ...\config\initializers\knock.rb

```ruby
change this
config.token_secret_signature_key = -> { Rails.application.credentials.secret_key_base }
to this
config.token_secret_signature_key = -> { Rails.application.credentials.read }
```