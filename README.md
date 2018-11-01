# Wbooks-Api

[![Build Status](https://travis-ci.org/wolox-training/jedl-rails.svg?branch=master)](https://travis-ci.org/wolox-training/jedl-rails)

This is an API where the user can see enabled books for rent, make rents, suggestions and select books for future readings.

## Getting Started

Clone this repository on your local machine in standard way

### Prerequisites

You need to install

- rbenv 1.1.1
- ruby 2.5.3
- rails 5.2.1
- postgresql 10.5 or superior

### Installing

Run bundle to install the dependencies

```
$ bundle install
```

## Running coding style test

To check the ruby style on our code, run

```
bundle exec rubocop app spec -R --format simple
```

## Running the tests

Running test

```
bundle exec rspec spec -fd
```

## On development

To execute this project please change to the directory where you clone this repo and write on console

```
$ rails serve
```

## License

wolox
