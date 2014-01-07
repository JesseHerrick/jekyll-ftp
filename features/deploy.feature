Feature: Deploy
	In order to make deployment easier.
	As a tech savy blogger.
	I want to be able to easily deploy my site via FTP.

	Scenario: Deploy a static site to FTP
		Given a simulated FTP server on port 21212
		And a new Jekyll site
		And a modified config file
		When I run `jekyll-ftp deploy`
		Then the FTP server should have the file "index.html"
		And the exit status should be 0

	Scenario: Deploy a static site to FTP without a valid config file
		Given a simulated FTP server on port 21213
		And a new Jekyll site
		When I run `jekyll-ftp deploy`
		Then the exit status should be 1

#	Scenario: Deploy a static site with a specified config file
#		Given a simulated FTP server on port 21214
#		And a new Jekyll site
#		And a modified config file
#		When I run `jekyll-ftp deploy --config tmp/test_site/_config.yml`
#		Then the exit status should be 0

	Scenario: Deploy a static site with a blank specified config file
		Given a new Jekyll site
		When I run `jekyll-ftp deploy --config`
		Then the exit status should be 1

	Scenario: Deploy a static site that hasn't been built
		Given a new Jekyll site
		When I run `jekyll-ftp deploy --no-build`
		Then the exit status should be 1
