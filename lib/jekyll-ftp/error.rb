module Jekyll_FTP
	class Error
		def self.file_missing(filename)
			abort("ERROR: #{filename} does not exist.\nMake sure you're in your site's root directory.")
		end

		def self.config_error(missing)
			unless missing.empty?
				say "ERROR: Config file not set up properly."
				missing.each do |missed|
					say "MISSING: #{missed}"
				end
				abort
			end
		end
	end
end