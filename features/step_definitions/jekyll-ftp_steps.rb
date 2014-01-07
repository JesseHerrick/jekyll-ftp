Given(/^a simulated FTP server$/) do
  @server = FakeFtp::Server.new(21212)
  @server.start
end

Given(/^a new Jekyll site$/) do
  `jekyll new tmp/test_site --force`
end

Given(/^modified config file$/) do
  # Modify _config.yml
  open("tmp/test_site/_config.yml", "a") do |file|
    file << "username: user\n"
    file << "password: password\n"
    file << "server: 127.0.0.1\n"
    file << "remote_dir: /\n"
  end
end

Then(/^the FTP server should have the file "(.*?)"$/) do |file|
  @server.files.should include("index.html")
end
