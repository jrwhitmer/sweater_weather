<div align="center">

# Sweater Weather
[![Contributors][contributors-shield]][contributors-url]
[![Issues][issues-shield]][issues-url]
[![Stargazers][stars-shield]][stars-url]
[![Forks][forks-shield]][forks-url]
![Build Badge][build-badge]
---


## Table of Contents
|Links
|--- |
[Setup](#setup)
[Learning Goals](#learning-goals)

</div>

<div align="center">

## Setup

</div>


  This project requires Ruby 2.7.2.

  * Fork this repository
  * From the command line, install gems and set up your DB:
      * `bundle install && bundle update`
      * `rails db:{create,migrate,seed}`
  * Run the test suite with `bundle exec rspec -fd`
  * Run your development server with `rails s` to see the app in action.

#### Project Configurations

  * Ruby version
      ```bash
      $ ruby -v
      ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin20]
      ```

  * [System dependencies](https://github.com/jrwhitmer/sweater_weather/blob/main/Gemfile)
      ```bash
      $ rails -v
      Rails 5.2.6
      ```

  * Database creation
      ```bash
      $ rails db:{drop,create,migrate}
      Created database 'sweater_weather_development'
      Created database 'sweater_weather_test'
      ```

      ```bash
      $ bundle install
      ```

  * [API key configuration](https://github.com/laserlemon/figaro)
      ```bash
      $ bundle exec figaro install
      ```
      Add your credentials & API keys to `config/application.yml`:

      ```yml
      #Backend Repo:
      1st API: go to https://developer.mapquest.com/documentation/geocoding-api/ to request an API key<br>
      2nd API: go to https://openweathermap.org/api/one-call-api to request an API key<br>
      3rd API: go to https://www.pexels.com/api  to request an API key<br>

      key: '<your api key>'
      ```

  * How to run the test suite
      ```bash
      $ bundle exec rspec -fd
      ```

  * [Local Deployment](http://localhost:3000), for testing
      ```bash
      $ rails s
      => Booting Puma
      => Rails 5.2.6 application starting in development
      => Run `rails server -h` for more startup options
      Puma starting in single mode...
      * Version 3.12.6 (ruby 2.7.2-p137)
      * Min threads: 5, max threads: 5
      * Environment: development
      * Listening on tcp://localhost:3000
      Use Ctrl-C to stop
      ```


<div align="center">

## Learning Goals

</div>


&nbsp; &nbsp; ⭐ &nbsp; &nbsp; Expose an API that aggregates data from multiple external APIs<br>
&nbsp; &nbsp; ⭐ &nbsp; &nbsp; Expose an API that requires an authentication token<br>
&nbsp; &nbsp; ⭐ &nbsp; &nbsp; Expose an API for CRUD functionality<br>
&nbsp; &nbsp; ⭐ &nbsp; &nbsp; Determine completion criteria based on the needs of other developers<br>
&nbsp; &nbsp; ⭐ &nbsp; &nbsp; Research, select, and consume an API based on your needs as a developer<br>

<div align="center">


# API Endpoints

</div>

<!-- MARKDOWN LINKS & IMAGES -->

[contributors-shield]: https://img.shields.io/github/contributors/jrwhitmer/sweater_weather.svg?style=flat-square
[contributors-url]: https://github.com/jrwhitmer/sweater_weather/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/jrwhitmer/sweater_weather.svg?style=flat-square
[forks-url]: https://github.com/jrwhitmer/sweater_weather/network/members
[stars-shield]: https://img.shields.io/github/stars/jrwhitmer/sweater_weather.svg?style=flat-square
[stars-url]: https://github.com/jrwhitmer/sweater_weather/stargazers
[issues-shield]: https://img.shields.io/github/issues/jrwhitmer/sweater_weather.svg?style=flat-square
[issues-url]: https://github.com/jrwhitmer/sweater_weather/issues
