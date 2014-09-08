# Postcodeapi

[![Build Status](https://travis-ci.org/Webworkz/postcodeapi.svg?branch=master)](https://travis-ci.org/Webworkz/postcodeapi) [![Code Climate](https://codeclimate.com/github/Webworkz/postcodeapi/badges/gpa.svg)](https://codeclimate.com/github/Webworkz/postcodeapi) [![Gem Version](https://badge.fury.io/rb/postcodeapi.png)](http://badge.fury.io/rb/ww-postcodeapi)

API wrapper for postcodeapi.nu zipcode api.

## Installation

Add this line to your application's Gemfile:

    gem 'ww-postcodeapi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ww-postcodeapi

## Setup

Add file `config/initializers/postcodeapi.rb`.

    require 'postcodeapi'
    Postcodeapi.configure do |config|
      config.api_key = "1234567890abcdefghizjklmnopqrstuvwxyz"
    end

## Example usage

Get an address for a zipcode:

    response = Postcodeapi.get_street("5041EB")
    # => #<OpenStruct street="Wilhelminapark", postcode="5041EB", town="Tilburg", latitude=51.9401, longitude=5.61531, x=133505, y=397537>


You can then use:

    response.street
    # => "Wilhelminapark"
    response.town
    # => "Tilburg"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
