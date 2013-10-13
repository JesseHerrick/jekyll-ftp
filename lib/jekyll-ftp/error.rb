module Jekyll_FTP
	class Error
		def self.file_missing(filename)
			abort("ERROR:".red + " #{filename} does not exist.\n" + "Make sure you're in your site's root directory.".yellow)
		end

		def self.config_error(missing)
			unless missing.empty?
				say "ERROR:".red + " Config file not set up properly."
				missing.each do |missed|
					say "  Missing:".yellow + " #{missed}"
				end
				abort
			end
		end
	end
end