begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "acts_as_protocolable"
    gemspec.authors = ["Igor Alexandrov"]
    gemspec.email = "igor.alexandrov@gmail.com"
    gemspec.homepage = "http://github.com/igor-alexandrov/acts_as_protocolable"

    gemspec.summary = "Guard of activity in your rails application."
    gemspec.description = "ActsAsProtocolable is the easiest way to protocol user activity inside your Rails admin interface."
    gemspec.files = FileList["[A-Z]*", "{generators,lib}/**/*"] - FileList["**/*.log"]
    gemspec.add_dependency("sys-admin", ">= 1.5.2")
    gemspec.add_dependency("activerecord", ">= 2.3.0")
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end