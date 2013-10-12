module Jekyll_FTP
	class Error
		def self.file_missing(filename)
			abort("ERROR: #{filename} does not exist.\nMake sure you're in your site's root directory.")
		end
	end
end