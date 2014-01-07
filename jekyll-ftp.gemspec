require File.join([File.dirname(__FILE__),'lib','jekyll-ftp','version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'jekyll-ftp'
  s.version = JekyllFTP::VERSION
  s.author = 'Jesse Herrick'
  s.email = 'jessegrantherrick@gmail.com'
  s.homepage = 'http://www.jessegrant.net'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Jekyll deployment with FTP made easy.'
  s.files = `git ls-files`.split("\n")
  s.require_paths << 'lib'
  s.bindir = 'bin'
  s.executables << 'jekyll-ftp'

  # Development Dependencies
  s.add_development_dependency('rake')
  s.add_development_dependency('bundler')
  s.add_development_dependency('cucumber')
  s.add_development_dependency('aruba')
  s.add_development_dependency('fake_ftp')

  # Runtime Dependencies
  s.add_runtime_dependency('commander')
  s.add_runtime_dependency('jekyll')
  s.add_runtime_dependency('colorize')
end
