# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'hoptoad_notifier/version'

Gem::Specification.new do |s|
  s.name        = %q{hoptoad_notifier}
  s.version     = HoptoadNotifier::VERSION
  s.summary     = %q{Send your application errors to our hosted service and reclaim your inbox.}

  s.files        = ['[A-Z]*', 'generators/**/*.*', 'lib/**/*.rb',
                    'test/**/*.rb', 'rails/**/*.rb', 'script/*',
                    'lib/templates/*.erb'].map { |glob| Dir.glob(glob) }.flatten
  
  s.require_path = 'lib'
  s.test_files   = Dir[*['test/**/*_test.rb']]

  s.has_rdoc         = true
  s.extra_rdoc_files = ["README.rdoc"]
  s.rdoc_options = ['--line-numbers', "--main", "README.rdoc"]

  s.add_runtime_dependency("activesupport")
  s.add_development_dependency("activerecord")
  s.add_development_dependency("actionpack")
  s.add_development_dependency("jferris-mocha")
  s.add_development_dependency("nokogiri")
  s.add_development_dependency("shoulda")

  s.authors = ["thoughtbot, inc"]
  s.email   = %q{support@hoptoadapp.com}
  s.homepage = "http://www.hoptoadapp.com"

  s.platform = Gem::Platform::RUBY
end