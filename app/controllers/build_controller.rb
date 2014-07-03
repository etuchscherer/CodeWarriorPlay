class BuildController < ApplicationController
  def index
  	redirect_to project_configurations_path unless ProjectConfiguration.configured?
  end
end
