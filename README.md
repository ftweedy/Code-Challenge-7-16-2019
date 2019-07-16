# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* How to run the test suite


# Code Challenge

This program was created as a coding challenge for a job application.  The program take in various requests to query the two text files that act the back-end database.  Javascript was used for the front and RubyOnRails was used for the back.

## Installation and Set-up

Follow the instructions below to set-up the code to execute.  All commands are run from the command line.

   ```
   # Download the code
   In the command line, navigate to the folder you wish to use for this project.
   Run the command "git clone https://github.com/ftweedy/Code-Challenge-7-16-2019.git".
    This will clone the project into your folder.

   # Update Yarn
   This code uses yarn and the yarn packages will need to be installed.
   Run the command "yarn install" to setup yarn.

   # Run server and navigate to website.
   Run the command "rails s".  This will start a local rails server on your machine.
   After the server is running, navigate to "http://localhost:3000/".  The website will be running and visible.
   ```

## Running the test suite.

Follow the instructions below to run the Ruby tests.

   ```
   # Run all tests
   Using the command line, navigate to the top level of the project folder.
   Run the command "bundle exec rspec".  This will run all the tests and output all results to the command line.

   #Run one of the two test files.
   Run the command "bundle exec rspec spec/requests/users_spec.rb" to run the test for the users.
   Run the command "bundle exec rspec spec/requests/groups_spec.rb" to run the test for the groups.
   ```