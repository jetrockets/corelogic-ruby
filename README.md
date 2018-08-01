# Corelogic

[![Gem Version](https://badge.fury.io/rb/corelogic-ruby.svg)](https://badge.fury.io/rb/corelogic-ruby)
[![Build Status](https://travis-ci.org/jetrockets/corelogic-ruby.svg?branch=master)](https://travis-ci.org/jetrockets/corelogic-ruby)
[![Test Coverage](https://api.codeclimate.com/v1/badges/92a2dbaed71a83277c63/test_coverage)](https://codeclimate.com/github/jetrockets/corelogic-ruby/test_coverage)
[![Maintainability](https://api.codeclimate.com/v1/badges/92a2dbaed71a83277c63/maintainability)](https://codeclimate.com/github/jetrockets/corelogic-ruby/maintainability)

CoreLogic API wrapper.

[https://developer.corelogic.com/property-api/apis](https://developer.corelogic.com/property-api/apis)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'corelogic-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install corelogic-ruby

## Configuring Corelogic

```ruby
Corelogic.configure(consumer_key: 'your_client_id', consumer_secret: 'your_client_secret')
```
Or alternatively:
```ruby
Corelogic.configure do |c|
    c.consumer_key = 'your_client_id'
    c.consumer_secret = 'your_client_secret'
end
```
## Usage
### Property Search
Search the CoreLogic database for a property based on the input address and returns a unique CoreLogic PropertyID for use in subsequent API calls for other CoreLogic Property Data. Requires address and either zip5 or city and state.
For example:
```ruby
result = Corelogic::Property.search(zip5: 'target_zip', address: 'target_address')
```
If the properties are found, the `result` will contain an array of `Corelogic::Property` objects.

Otherwise, if nothing is found, search returns `Corelogic::Error::NotFound: No records returned from search`

### Property data
Get Property data by CoreLogic PropertyID.
For example:
````ruby
property = Corelogic::Property.new(corelogicPropertyId: 'someCorelogicPropertyId')

````
#### Property Ownership
Get detailed property ownership data based on an input CoreLogic PropertyID.
```ruby
property.ownership
=> #<Corelogic::Property::Ownership:0x007fe422132460 ...>
```
#### Following methods are provided for an `Corelogic::Property` instance.
    #ownership
    #building
    #tax_assessment
    #site
    #location
    #owner_transfer
    #last_market_sale
    #prior_sale
    #load_details

## Credits

Sponsored by [JetRockets](http://www.jetrockets.pro).

![JetRockets](http://jetrockets.pro/JetRockets.jpg)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

