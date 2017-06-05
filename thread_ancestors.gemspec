name = "thread_ancestors"
$LOAD_PATH << File.expand_path("../lib", __FILE__)
require "#{name.tr("-", "/")}/version"

Gem::Specification.new name, ThreadAncestors::VERSION do |s|
  s.summary = "Allows Thread to carry context from ancestors."
  s.authors = ["Adam Hart"]
  s.email = "pididiot1@gmail.com"
  s.homepage = "https://github.com/adam-hart/#{name}"
  s.files = `git ls-files lib/ bin/ MIT-LICENSE`.split("\n")
  s.license = "MIT"
  s.required_ruby_version = ">= 2.1.0"
end
