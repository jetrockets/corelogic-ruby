[![Build Status](https://travis-ci.org/jetrockets/corelogic-ruby.svg?branch=master)](https://travis-ci.org/jetrockets/corelogic-ruby)

# Corelogic

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/corelogic`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

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
result = Corelogic::Property.search(zip5: '01106', address: '103 Birchwood Ave, Longmeadow, MA, 01106')
```
If the properties are found, the `result` will contain an array of `Corelogic::Property` objects.

Otherwise, if nothing is found:
```ruby
result = Corelogic::Property.search(zip5: '0000', address: '103 Birchwood Ave, Longmeadow, MA, 01106')
```
Returns `Corelogic::Error::NotFound: No records returned from search`

### Property Ownership
Get detailed property ownership data based on an input CoreLogic PropertyID.
```ruby
ownership = result.first.ownership
=> #<Corelogic::Property::Ownership:0x007fe422132460 ...>
```
Where `result` - the result of success Property Search

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jetrockets/corelogic-ruby.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

