class BuildController < ApplicationController
  def index
  	redirect_to project_configurations_path unless ProjectConfiguration.configured?
  	@sync = Github.new_synchronizer
	@config = ProjectConfiguration.first
  end

  def clone
  	sync = Github.new_synchronizer
  	if sync.clone
  		flash[:notice] = 'Successfully cloned'
  	else
  		flash[:error] = 'Cloning failed'
  	end
  		redirect_to build_index_path
  end
end
