class Redis
  class Client
    protected
    def logging(commands) # Overwrite redis-rb logger
      return yield unless @logger && @logger.debug?
      commands.each do |name, *args|
        ::ActiveSupport::Notifications.instrument('query.redis_logger', :query => "#{name.to_s.upcase} #{args.map(&:to_s).join(" ")}") do
          yield
        end
      end
    end
  end
end
