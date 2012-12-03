# RedisLogger

RedisLogger is a better redis logger for Rails application

## Setup

**1. Add RedisLogger to your gemfile**

```ruby
gem 'redis_logger'
```

**2. Generate initializer**

    rails g redis_logger:install

**3. Initialize Redis and specify logger**

```ruby
$redis = Redis.new(:logger => Rails.logger)
```

## Preview

![Alt text](http://blog.hellolucky.info/wp-content/uploads/2012/12/螢幕快照-2012-12-03-下午8.49.19.png)

## Author

* I'm hellolucky, I come from Taiwan
* hellolucky123@gmail.com
* http://twitter.com/hellolucky123
* http://blog.hellolucky.info


## License

This project rocks and uses MIT-LICENSE.