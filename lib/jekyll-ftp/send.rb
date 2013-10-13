module Jekyll_FTP
	class SubCommand
		def self.send(ftp, path)
			# Create an array of the files within this directory.
			entries = Dir.entries(path)
			# Remove the dot dirs.
			entries.delete_if do |entry|
				entry == ".." || entry == "."
			end

			# For all of the files...
			entries.each do |entry|
				# Skip the directories.
				next if File.directory?(entry)

				# Path variables.
				current_path = Dir.getwd
				entry_path = current_path + "/" + entry
				remote_path = $config["remote_dir"] + "/" + entry

				# Upload the file(s).
				say "    Uploading: ".yellow + entry
				ftp.putbinaryfile(entry_path, remote_path)
			end

			entries.each do |entry|
				if File.directory?(entry)
					init_path = Dir.getwd
					path += "/#{entry}"
					puts path
					# Restart the process and upload all files.
					
					# Works on every dir... now I need to send them to ftp

					send(ftp, path)
				end
			end
		end
	end
end