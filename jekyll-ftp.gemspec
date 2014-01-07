require File.join([File.dirname(__FILE__),'lib','jekyll-ftp','version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'jekyll-ftp'
  s.version = JekyllFTP::VERSION
  s.author = 'Your Name Here'
  s.email = 'your@email.address.com'
  s.homepage = 'http://your.website.com'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A description of your project'
  s.files = `git ls-files`.split("\n")
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','jekyll-ftp.rdoc']
  s.rdoc_options << '--title' << 'jekyll-ftp' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'jekyll-ftp'

  # Development Dependencies
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('cucumber')
  s.add_development_dependency('aruba')

  # Runtime Dependencies
  s.add_runtime_dependency('thor')
end
