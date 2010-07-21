require 'rubygems'
require 'rake'
require 'rake/gempackagetask'

spec = Gem::Specification.new do |s| 
  s.name = "acts_as_protocolable"
  s.version = "0.5.0"
  s.author = "Igor Alexandrov"
  s.email = "igor.alexandrov@gmail.com"
  s.homepage = "http://github.com/igor-alexandrov/acts_as_protocolable"
  s.platform = Gem::Platform::RUBY
  s.summary = "Guard of activity in your rails application."
  s.description = "ActsAsProtocolable is the easiest way to protocol user activity inside your Rails admin interface."
  s.files = FileList["{lib}/**/*"].to_a
  s.require_path = "lib"
  s.test_files = FileList["{test}/**/*test.rb"].to_a
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.textile"]
  s.add_dependency("sys-admin", ">= 1.5.2")
  s.add_dependency("activerecord", ">= 2.3.0")
end
 
Rake::GemPackageTask.new(spec) do |pkg| 
  pkg.need_tar = true 
end