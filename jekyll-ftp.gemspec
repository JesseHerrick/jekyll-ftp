# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll-ftp/version'

Gem::Specification.new do |spec|
  spec.name          = "bukkit"
  spec.version       = Jekyll_FTP::VERSION
  spec.authors       = ["Jesse Herrick"]
  spec.email         = ["jessegrantherrick@gmail.com"]
  spec.description   = %q{Jekyll deployment made easy.}
  spec.summary       = %q{Deploy your Jekyll site to FTP with one simple command!}
  spec.homepage      = "https://github.com/JesseHerrick/bukkit"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency('colorize')
  spec.add_dependency('commander')
end