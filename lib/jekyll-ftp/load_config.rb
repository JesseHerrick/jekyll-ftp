require "yaml"
require "colorize"

module JekyllFTP
	def self.load_config(file = "#{Dir.pwd}/_config.yml")
		file = File.expand_path(file)

		# Errors
		raise "Config file not found" unless File.exists?(file)
		raise "Config file not YAML" unless File.extname(file) == ".yml"

		# Validate config file
		config_file = YAML.load_file(file).inspect
		missing = []

		# Checks if config contains a certain key, then adds it to the missing array if false.
		def check_config_for(key)
			if config_file["#{key}"].nil?
				missing << "#{key}"
			end
		end

		# Now to validate the config file...
		check_config_for "username"
		check_config_for "password"
		check_config_for "server"
		check_config_for "remote_dir"

		abort "Missing the following from config file:\n".red + missing.each { |missed| "  #{missed}\n".light_red }
	end
end