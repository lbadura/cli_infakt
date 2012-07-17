# -*- encoding: utf-8 -*-
require File.expand_path('../lib/clinfakt/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Lukasz Badura"]
  gem.email         = ["lukasz@futuresimple.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "clinfakt"
  gem.require_paths = ["lib"]
  gem.version       = Clinfakt::VERSION
  gem.add_development_dependency('rdoc')
  gem.add_development_dependency('aruba')
  gem.add_development_dependency('rake','~> 0.9.2')
  gem.add_dependency('methadone', '~>1.2.1')
  

  gem.add_dependency('oauth')
end
