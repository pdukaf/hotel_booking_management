
[![Ruby 2.6.6]
[![Rails 6.1.6]

# README

## Hotel Booking Management

This application is to create the reservation for each hotel.
## Before coding

## Local Setup

1. Install [RVM](https://rvm.io/rvm/install)
2. Install ruby 2.6.6 using rvm
 ```
  rvm install 2.6.6
```
3. Install MongoDB
``` 
brew installmongodb-community@5.0
```

4. Clone this repository
5. Inside the project folder Install bundler
```
  gem install bundler
```
6. Install gems with bundler
```
  bundle install
```
7. Install webpacker
```
rails webpacker:install
```
8. Start the server process
```
  rails server
```
9. Run specs
```
  rspec
```

10. API endpoints:
  - List all reservations.
  ```localhost:3000/api/v1/reservations, Method: GET```
  - Fetch single reservation.
  ```localhost:3000/api/v1/reservastions/:id, Method: GET ```
  - Create reservation.
  ```localhost:3000/api/v1/reservations, Method: POST```
  ```Sample request body: {"reservation":{"hotel_name": "hello", "price": 12.22, "currency": "Euro", "arrival_date":"2022-07-17","departure_date":"2022-07-25", "guest_name": "Harry", "guest_email":"kafleumesh@gmail.com"}}```
  - Update reservation.
  ```localhost:3000/api/v1/reservations/:id, Method: PUT```
  ```Sample body: {"reservation":{"hotel_name":123}}```
  - Delete reservation.
  ```localhost:3000/api/v1/reservations/:id, Method: DELETE```

11. Thing that should improvise are as follows:
  - Improvement in UI.
  - Implementation of test coverage measure.
  - Implementation of linter.
  - Dockerized version of the application.

