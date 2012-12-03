require 'rails/generators'

module RedisLogger
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Copy RedisLogger default files"
      def copy_initialize
        copy_file "redis_logger.rb", "config/initializers/redis_logger.rb"
      end
    end
  end
end