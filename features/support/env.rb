require 'aruba/cucumber'
require 'fake_ftp'

Before do
  @server.stop if @server
end