# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pylintr/version'

Gem::Specification.new do |spec|
  spec.name          = "pylintr"
  spec.version       = Pylintr::VERSION
  spec.authors       = ["esabelhaus"]
  spec.email         = ["eric.sabelhaus@gmail.com"]
  spec.summary       = %q{Pylint wrapper for ruby: https://github.com/PyCQA/pylint}
  spec.description   = %q{Pylint wrapper for ruby: https://github.com/PyCQA/pylint}
  spec.homepage      = "https://github.com/esabelhaus/pylintr"
  spec.license       = "ISC"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = 'pylint_2_7/bin/pylint'
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
