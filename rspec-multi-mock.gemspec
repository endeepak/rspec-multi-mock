# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "version"

Gem::Specification.new do |s|
  s.name        = "rspec-multi-mock"
  s.version     = MultiMock::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Deepak N"]
  s.email       = ["endeep123@gmail.com"]
  s.homepage    = "https://github.com/endeepak/rspec-multi-mock"
  s.summary     = %q{Multiple mock frameworks support for RSpec}
  s.description = %q{Allows multiple mock frameworks to be in action in RSpec.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_runtime_dependency("rspec-core", ">= 3.7.0")
  s.add_development_dependency("rspec", ">= 3.7.0")
  s.add_development_dependency("rake")
  s.add_development_dependency("mocha", "~> 1.7.0")
  s.add_development_dependency("rr", "~> 1.1.2")
end
