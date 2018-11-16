
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hemera/version'

Gem::Specification.new do |spec|
  spec.name          = 'hemera'
  spec.version       = Hemera::VERSION
  spec.authors       = 'JianweiWangs'
  spec.email         = 'wangjianwei.sir@gmail.com'

  spec.summary       = 'development tool'
  spec.description   = 'Hemera is a development tool'
  spec.homepage      = 'https://github.com/JianweiWangs/Hemera'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'cocoapods', '~> 1.5', '>= 1.5.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'codecov', '>= 0.1.14'
  spec.add_dependency 'gli', '~> 2.18'
end
