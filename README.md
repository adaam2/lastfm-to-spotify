# Set up

Install rbenv: https://github.com/rbenv/rbenv#installation

Once installed, `cd` to the app directory. Then run:

```
rbenv install 2.3.1
rbenv local 2.3.1
```

Which sets the version of ruby for this folder to 2.3.1

Install rails:

```
gem install rails
```

Then run bundler:

```
bundle install
```

Ensure the output of `rails -v` is 5+

```
rails -v
=> Rails 5.1.3
```

Then setup the app for the first time:

```
rails db:create
rails db:migrate
```

Install foreman:

```
gem install foreman
```

Run the application with foreman:

```
foreman start -f Procfile.dev
```

This will run all of the various processes needed for the app (redis etc)

Navigate to `localhost:3000`

---

# Some simple rails commands:

Get a development console up, where you can play around with data and run database queries:

```
rails c
```

Update migrations to latest:

```
rails db:migrate
```
`rake` and `rails` are interchangeable

Seed the database with admin users and other test data:

```
rake db:seed
```

# URLS

Access the admin area:

```
localhost:3000/admin
```


