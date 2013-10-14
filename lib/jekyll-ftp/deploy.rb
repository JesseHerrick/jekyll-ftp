require 'yaml'
require 'net/ftp'

module Jekyll_FTP
	class Command
		def self.deploy(deploy_now = true)
			if File.exists?("_config.yml")
				# The file is there and will now be parsed.
				$config = YAML.load_file("_config.yml")

				# Create variables from the config hash.
				server = $config["server_url"]
				username = $config["username"]
				remote_dir = $config["remote_dir"]

				# If the server or username is missing...
				if server.nil? || username.nil? || remote_dir.nil?
					# Make a new array for the missing configuration.
					missing = Array.new
					# If server doesn't exist add it to the array of missing stuff.
					if server.nil?
						missing.push("server_url")
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

				# Give some info about the FTP server.
				say "      FTP Server: ".blue + server
				say "        Username: ".blue + username
				say "Remote Directory: ".blue + remote_dir

				# Error handling over...
				# Now deploy!
				say "Logging in...".yellow
				ftp = Net::FTP.new(server)
				ftp.login(username, password)
				ftp.chdir(remote_dir)
				say "Logged in!".green
				say "\nDeploying...".yellow unless deploy_now == false

				# Delete old files.
				if File.directory?("_site")
					Jekyll_FTP::SubCommand.clean(ftp)
				else
					say "ERROR: _site directory does not exist."
					abort "Have you tried `jekyll build`?".yellow
				end

				# Deploy the site... unless not supposed to deploy.
				unless deploy_now == false
					Dir.chdir("_site")
					path = Dir.getwd
					Jekyll_FTP::SubCommand.send(ftp, path)
				end
			else
				# The file is missing!
				Jekyll_FTP::Error.file_missing("_config.yml")
			end
		end
	end
end