# RedisBasement

Cache HTTP get requests in Redis.

Don't go out for cached pages. Fetch them from the basement instead! Useful for development.

## Installation

Add this line to your application's Gemfile:

    gem 'redis_basement'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install redis_basement

## Usage

1. require() the gem.

        require 'redis_basement'

2. extend RedisBasement

        module MyModule
          extend RedisBasement
          include HTTParty

3. Call fetch() on resources that you want to GET.

        fetch('http://localhost/resource') # cache page in Redis for 1 hour
        fetch('http://localhost/resource2', 30) # cache page in Redis for 30 seconds

The fetch method depends on an existing get() method, such as that provided by including HTTParty or similar gem. Since HTTParty/net/http requests can't be serialized, the gem only caches the body of the requests in Redis. Patches welcome.

The cached pages in Redis are namespaced with the name of the class/module into which RedisBasement is extended, e.g. 'MyModule' in this example.

## Contributing

1. Fork it ( http://github.com/nmarley/redis_basement/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
