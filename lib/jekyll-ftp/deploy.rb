require 'yaml'

module Jekyll_FTP
	class Command
		def self.deploy
			if File.exists?("_config.yml")
				config = YAML.load_file("_config.yml")
				puts config
			else
				Jekyll_FTP::Error.file_missing("_config.yml")
			end
		end
	end
end