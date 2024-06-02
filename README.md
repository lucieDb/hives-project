# README

***Welcome to the hives project***

**Prerequisites**
- Rails 7.1.3.3
- Ruby 3.3.0
- Vue 3 in Vite

**Project Goal**

For the bees lovers, this is an environnement to list all the hives you got !

This project is separated in 2 parts : back-end in Rails Api and a front-end in VueJS.
(For the VueJs part : go to the README.md in the client/README.md)

1. **Checkout the repository**

`git clone https://github.com/lucieDb/hives-project.git`

2. **Build a database with PostgreSQL**

Create an .env file at the root project, declare your own environment variables like : 

`DATABASE_USERNAME=your_username`

`DATABASE_PASSWORD=your_password`

Use it in the database.yml like this : 
``
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: <%= ENV.fetch("DATABASE_USERNAME") %>
  password: <%= ENV.fetch("DATABASE_PASSWORD") %>
  host: localhost
``

Run the following commands : 

`bundle exec rails db:create`
`bundle exec rails db:migrate`

3. **Start Rails server**

`bundle exec rails s`

4. **Run tests**

`bundle exec rails db:migrate RAILS_ENV=test` (only if it's the first time)
`bundle exec rails test test/path_test.rb`

And now, you can visit the site with [this URL](http://localhost:3000/api/v1/hives)
Add a hive with the console rails, for example : `Hive.create(name: "BeeGeezz", weight: 150)`
Your BeeGeezz Hive will appaer with a json format. For the action controller, let's go to the VueJs Readme to launch the front side.

**Versioning**

In this project, I create a v1 application in an api folder. Add a v2 if you want to improve this project.  

**Documentation**
- [Ruby Guide](https://guides.rubyonrails.org/api_app.html)
- [Medium article](https://medium.com/@laasrisaid34/step-by-step-guide-to-creating-a-ruby-on-rails-application-with-postgresql-46fef05c212b)
