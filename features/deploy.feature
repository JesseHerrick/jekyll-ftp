Feature: Deploy
	In order to make deployment easier.
	As a tech savy blogger.
	I want to be able to easily deploy my site via FTP.

	Scenario: Deploy a static site to FTP.
		Given a simulated FTP server
		And a new Jekyll site
		And modified config file
		When I run `jekyll-ftp deploy`
		Then the FTP server should have the file "index.html"
		And the exit status should be 0

	Scenario: Deploy a static site to FTP without a valid config file
		Given a simulated FTP server
		And a new Jekyll site
		When I run `jekyll-ftp deploy`
		Then the server should