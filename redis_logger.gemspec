$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "redis_logger/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "redis_logger"
  s.version     = RedisLogger::VERSION
  s.authors     = ["hellolucly"]
  s.email       = ["hellolucky123@gmail.com"]
  s.homepage    = "http://blog.hellolucky.info"
  s.summary     = "RedisLogger is a better redis logger for Rails application"
  s.description = "RedisLogger is a better redis logger for Rails application"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 3.2.0"
  s.add_dependency "redis"
end
