require "net/ftp"
require "yaml"

module JekyllFTP
	class Command
		def self.deploy(options)
      # Set config
      config_file = options[:config] || "_config.yml"
      JekyllFTP.load_config(config_file)

      # Load config
      config = YAML.load_file(config_file).inspect

      # Build server
      `jekyll build` unless options[:no_build] == true
      raise "Server not built properly, missing '_site/' directory." unless Dir.exists? "_site"

      # Set some variables
      username = config[:username]
      password = config[:password]
      server = config[:server]
      remote_dir = config[:remote_dir]
      path = Dir.pwd + "_site"

      # Give some info about the FTP server.
      say "      FTP Server: ".blue + server
      say "        Username: ".blue + username
      say "Remote Directory: ".blue + remote_dir

      # Now deploy
      say "Logging in...".yellow
      ftp = Net::FTP.new(server)
      ftp.login(username, password)
      ftp.chdir(remote_dir)
      say "Logged in!".green
      say "\nDeploying...".yellow

      # Now to push the files... recursively.
      init_path ||= path
      Dir.entries(path).each do |file|
        next if [".", ".."].include? file

        file_path = path + "/" + file
        short_file_path = file_path[init_path.length, file_path.length]
        if File.directory?(file_path)
          ftp.mkdir(file) unless ftp.nlst.index(file)
          ftp.chdir(file)
          send(ftp, file_path, init_path)
          ftp.chdir("..")
        else
          puts "Deploying: ".light_green + short_file_path
          puts "       To: ".yellow + ftp.pwd + "/" + file
          ftp.putbinaryfile(path + "/" + file, file)
        end
      end
		end
	end
end