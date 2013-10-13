require 'yaml'
require 'net/ftp'

module Jekyll_FTP
	class Command
		def self.deploy
			if File.exists?("_config.yml")
				# The file is there and will now be parsed.
				$config = YAML.load_file("_config.yml")

				# Create variables from the config hash.
				server = $config["server"]
				username = $config["username"]
				remote_dir = $config["remote_dir"]

				# If the server or username is missing...
				if server.nil? || username.nil? || remote_dir.nil?
					# Make a new array for the missing configuration.
					missing = Array.new
					# If server doesn't exist add it to the array of missing stuff.
					if server.nil?
						missing.push("server")
					end
					# If username doesn't exist add it to the array of missing stuff.
					if username.nil?
						missing.push("username")
					end
					# If remote_dir doesn't exist add it to the array of missing stuff.
					if remote_dir.nil?
						missing.push("remote_dir")
					end

						# Pass the missing array to 'config_error'.
						Jekyll_FTP::Error.config_error(missing)
					end

					# Error handling over...
					# Now deploy!
					say "Deploying!".yellow
					ftp = Net::FTP.new(server)
					ftp.login(username, password)
					ftp.chdir(remote_dir)

					# Delete old files.
					if File.directory?("_site")
						Jekyll_FTP::Command.clean(ftp)
					else
						say "ERROR: _site directory does not exist."
						abort "Have you tried `jekyll build`?".yellow
					end

					# Deploy the site.
					Dir.chdir("_site")
					path = Dir.getwd
					Jekyll_FTP::SubCommand.send(ftp, path)
					ftp.quit
				else
					# The file is missing!
					Jekyll_FTP::Error.file_missing("_config.yml")
				end
			end
		end
	end