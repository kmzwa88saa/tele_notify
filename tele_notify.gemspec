# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "acts_as_votable/version"

Gem::Specification.new do |s|
  s.name        = "tele_notify"
  s.version     = TeleNotify::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["ppati000", "Ryan"]
  s.email       = ["ppati000@me.com"]
  s.homepage    = "http://rubygems.org/gems/tele_notify"
  s.summary     = %q{Rails gem to allowing records to be votable}
  s.description = %q{Rails gem to allowing records to be votable}

  s.rubyforge_project = "acts_as_votable"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "sqlite3", '~> 1.3.9'
end
