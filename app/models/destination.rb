class Destination
	def self.exists?
		@configuration = ProjectConfiguration.first
		File.directory?(@configuration.destination)
	end
end