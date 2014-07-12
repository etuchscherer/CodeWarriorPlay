class StuxnetController < ApplicationController

	before_action :synchronizer

	def deploy
		if @sync.pull
			redirect_to '/'
		else
			fail
		end
	end

	private

	def synchronizer
		@config = ProjectConfiguration.first
		@sync = Github.new_synchronizer({
			owner: @config.owner,
			name: @config.name,
			destination: @config.destination,
			source: @config.source
		}) unless @config.nil?
	end
end
