require 'active_support/log_subscriber'

module RedisLogger
  class LogSubscriber < ActiveSupport::LogSubscriber
    def self.runtime=(value)
      Thread.current['redis_logger_query_runtime'] = value
    end

    def self.runtime
      Thread.current['redis_logger_query_runtime'] ||= 0
    end

    def self.reset_runtime
      rt, self.runtime = runtime, 0
      rt
    end

    def initialize
      super
      @odd_or_even = false
    end

    def query(event)
      self.class.runtime += event.duration
      return unless logger.debug?

      identifier = color('Redis (%.2fms)' % event.duration, RED, true)
      query = event.payload[:query]
      query = color query, nil, true if odd?

      debug "#{identifier} #{query}"
    end

    def odd?
      @odd_or_even = !@odd_or_even
    end

    def logger
      return @logger if defined? @logger
      self.logger = ::ActiveRecord::Base.logger
    end

    def logger=(logger)
      @logger = logger
    end
  end
end

RedisLogger::LogSubscriber.attach_to :redis_logger