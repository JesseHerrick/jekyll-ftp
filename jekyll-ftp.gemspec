# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll-ftp/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-ftp"
  spec.version       = Jekyll_FTP::VERSION
  spec.authors       = ["Jesse Herrick"]
  spec.email         = ["jessegrantherrick@gmail.com"]
  spec.description   = %q{Jekyll deployment made easy.}
  spec.summary       = %q{Deploy your Jekyll site to FTP with one simple command!}
  spec.homepage      = "https://github.com/JesseHerrick/jekyll-ftp"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency('colorize')
  spec.add_runtime_dependency('commander')
  spec.add_runtime_dependency('jekyll')

  spec.add_development_dependency('bundler')
  spec.add_development_dependency('rake')
end