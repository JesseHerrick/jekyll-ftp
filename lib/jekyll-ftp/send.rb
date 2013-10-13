module Jekyll_FTP
	class SubCommand
		def self.send(ftp, path, init_path = nil)
			init_path ||= path
  			Dir.entries(path).each do |file|
    			next if ['.', '..'].include? file
    
    			file_path = path + '/' + file
    			short_file_path = file_path[init_path.length, file_path.length]
    			if File.directory?(file_path)
      				ftp.mkdir(file) unless ftp.nlst.index(file)
      				ftp.chdir(file)
      				send(ftp, file_path, init_path)
      				ftp.chdir('..')
    			else
      				puts "Deploying: ".green + short_file_path
      				puts "       To: ".yellow + ftp.pwd + '/' + file
    			  	ftp.putbinaryfile(path + '/' + file, file)
    			end
			end
		end
	end
end