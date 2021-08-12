## Getting Started
These instructions will get you a copy of the base project in rails on your local machine for development and testing purposes.

### Prerequisites
What things you need to install the software and how to install them.
#### Ruby
Ruby version for this project is `3.0.1`.
rbenv is our recommened and preffered ruby version management software. If you don't have rbenv installed on your system. You can see the installation instructions [here.](https://github.com/rbenv/rbenv)
For installing the ruby version, type in the following command on your terminal ```rbenv install 3.0.1```.
One can check the installed ruby version by the following command ```ruby -v```.
The output should be something like this ``ruby 3.0.1p64``.
#### Rails
Rails version for this project is ` 6.1.4`.
#### Postgres
Our preferred database managing software is Postgres. If not installed, one can look into their official documentation [here](https://www.postgresql.org/download) and follow the steps as given.
#### Yarn
Make sure you have yarn installed on your system. If you haven't, just refer to this [how to install.](https://classic.yarnpkg.com/en/docs/install/#debian-stable "how to install")
#### Git
Make sure you have git installed on your system. If you haven't, just refer this [How to install Git.](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
#### Cloning the Repository
For cloning the Github repository and go to the project follow the following commands:
```
git clone https://github.com/devhassanmahmood/roman_test_task.git
cd roman_test_task
```
#### Project Dependencies
To setup the project, follow the below commands in the project directory:
```
gem install bundler
bundle install
yarn install
```
#### Create and setup the database
Edit the database configuration file `database.yml` as required then run the following commands to create and setup the database.
```
bundle exec rake db:create
bundle exec rake db:setup

```
#### Starting the application
You can start the rails server using the command given below:
```
bundle exec rails server OR rails s
```
And now you can visit the site with the URL http://localhost:3000 .