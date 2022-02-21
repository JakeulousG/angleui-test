# README
Test application for Angle UI

* Covered features
1.) User login & Registration
2.) Basic Products CRUD
3.) Dashboard

* Ruby version
2.7.5
* System dependencies
AngleUI Kit
node version 14
* Configuration

* Database creation
createuser -P -d angleui
(password for the user must be password)
rails db:create
rails db:migrate db:seed

* Setup guide
npm install
yarn install -check-files
createuser -P -d angleui
(password for the user must be password)
rails db:create
rails db:migrate db:seed
rails s