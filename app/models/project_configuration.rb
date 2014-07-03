class ProjectConfiguration < ActiveRecord::Base
	def self.configured?
		ProjectConfiguration.any?
	end
end
