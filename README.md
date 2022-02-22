
# README

Test application for Angle UI, application folder is based off the provided rails application, and not a migration of the theme to an existing separate project

## Covered features

 1. User Login & Registration
 2. Basic Products CRUD
 3. Dashboard
 4. User Login - Sessions

## System Requirements

 - Ruby 2.6.4
 - Node Version 14

## Database creation

 1. `createuser -P -d angleui`
 2. (password for the user must be password, or change to your prefered password)
 3. `rails db:create`
 4.  `rails db:migrate db:seed`

## Setup guide

 1. `npm install`
 2. `yarn install -check-files`
 3.  `createuser -P -d angleui`
 4. (password for the user must be password, or change to your
    preference in `config/database.yml`)
 5. `bundle install`
 6. `rails db:create`
 7. `rails db:migrate db:seed`
 8. `rails s`

## Login Credentials
 - **Email:** admin@admin.com
 - **Password:** admin

