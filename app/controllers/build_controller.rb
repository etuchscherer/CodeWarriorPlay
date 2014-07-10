class BuildController < ApplicationController

  before_action :get_config

  def index
  	redirect_to project_configurations_path unless ProjectConfiguration.configured?
    synchronizer
  end

  def clone
  	synchronizer
  	if @sync.clone
  		flash[:notice] = 'Successfully cloned'
  	else
  		flash[:error] = 'Cloning failed'
  	end
  		redirect_to build_index_path
  end

  private

  def synchronizer
    @sync = Github.new_synchronizer({
      owner: @config.owner,
      name: @config.name,
      destination: @config.destination,
      source: @config.source
    }) unless @config.nil?
  end

  def get_config
    @config = ProjectConfiguration.first
  end
end
