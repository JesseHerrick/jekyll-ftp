module Jekyll_FTP
	class SubCommand
		def self.clean(ftp)
			ftp.nlst.each do |file|
				next if ['.', '..'].include?(file)
				if directory?(ftp, file)
					ftp.chdir file
					clean(ftp)
					ftp.chdir '..'
					puts "Deleting directory: ".red + ftp.pwd + "/" + file + "/"
					ftp.rmdir(file)
				else
					puts "Deleting: ".red + ftp.pwd + "/" + file
					ftp.delete(file)
				end
			end
		end
		def self.directory?(ftp, filename)
			ftp.chdir(filename)
			ftp.chdir('..')
			return true
			rescue
			return false
		end
	end
end