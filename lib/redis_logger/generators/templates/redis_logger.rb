class Redis
  class Client
    protected
    def logging(commands) # Overwrite redis-rb logger
      # Determin if Log every thing by Rails.logger because ActiveRecord Callback can't use @logger
      return yield unless Rails.logger.debug?
      commands.each do |name, *args|
        ::ActiveSupport::Notifications.instrument('query.redis_logger', :query => "#{name.to_s.upcase} #{args.map(&:to_s).join(" ")}") do
          @exec_result = yield
        end
      end
      return @exec_result
    end
  end
end
