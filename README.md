# em-postgresql-adapter

PostgreSQL fiber-based ActiveRecord 3.1.x connection adapter for Ruby 1.9.

IMPORTANT: If you need to use em-postgresql-adapter with ActiveRecord < 3.1 please use the <https://github.com/leftbee/em-postgresql-adapter/tree/pre-3_1> branch instead.

## Installation

Edit your Gemfile:

    gem 'pg'
    gem 'em-postgresql-adapter', :git => 'git://github.com/leftbee/em-postgresql-adapter.git'
    gem 'rack-fiber_pool',  :require => 'rack/fiber_pool'
    gem 'em-synchrony', :git     => 'git://github.com/igrigorik/em-synchrony.git',
                        :require => ['em-synchrony',
                                     'em-synchrony/activerecord']

Then edit your environment (i.e., production.rb, staging.rb, etc.) and make sure threadsafe! is enabled.
Also make sure to install the Rack::FiberPool middleware as early in the stack as possible:

    MyRails3App::Application.configure do
      # ...
      config.middleware.insert_before ActionDispatch::ShowExceptions, Rack::FiberPool
      config.threadsafe!
      # ...
    end

And finally, edit your config/database.yml:

    production:
      adapter: em_postgresql
      database: myapp_production
      username: root
      password:
      host: localhost
      pool: 6
      connections: 6

## Benchmark

Using a modified aync_rails app <https://github.com/igrigorik/async-rails>:

    class WidgetsController < ApplicationController
      def index
        Widget.find_by_sql("select pg_sleep(1)")
        render :text => "Oh hai"
      end
    end

Results:

    p:~ ruben$ ab -c 220 -n 2000 http://127.0.0.1:3000/widgets
    This is ApacheBench, Version 2.3 <$Revision: 655654 $>
    Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
    Licensed to The Apache Software Foundation, http://www.apache.org/

    Benchmarking 127.0.0.1 (be patient)
    Completed 200 requests
    Completed 400 requests
    Completed 600 requests
    Completed 800 requests
    Completed 1000 requests
    Completed 1200 requests
    Completed 1400 requests
    Completed 1600 requests
    Completed 1800 requests
    Completed 2000 requests
    Finished 2000 requests


    Server Software:        thin
    Server Hostname:        127.0.0.1
    Server Port:            3000

    Document Path:          /widgets
    Document Length:        6 bytes

    Concurrency Level:      220
    Time taken for tests:   21.075 seconds
    Complete requests:      2000
    Failed requests:        0
    Write errors:           0
    Total transferred:      558000 bytes
    HTML transferred:       12000 bytes
    Requests per second:    94.90 [#/sec] (mean)
    Time per request:       2318.292 [ms] (mean)
    Time per request:       10.538 [ms] (mean, across all concurrent requests)
    Transfer rate:          25.86 [Kbytes/sec] received

    Connection Times (ms)
                  min  mean[+/-sd] median   max
    Connect:        0    1   2.3      0      10
    Processing:  1007 2219 297.2   2123    3571
    Waiting:     1007 2215 298.4   2122    3569
    Total:       1017 2220 297.0   2123    3574

    Percentage of the requests served within a certain time (ms)
      50%   2123
      66%   2128
      75%   2134
      80%   2580
      90%   2645
      95%   2702
      98%   2865
      99%   3013
     100%   3574 (longest request)

## Credits

Based on brianmario's mysql2 em adapter <https://github.com/brianmario/mysql2> and oldmoe's neverblock-postgresql-adapter <https://github.com/oldmoe/neverblock-postgresql-adapter>.

## License

This software is released under the MIT license.
