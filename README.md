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

##### 2. Create database.yml file

Copy the sample database.yml file and edit the database configuration as required.

```bash
cp config/database.yml.sample config/database.yml
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

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000
