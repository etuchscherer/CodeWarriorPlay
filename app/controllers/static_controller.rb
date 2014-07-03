class StaticController < ApplicationController

  def welcome
  	redirect_to build_index_path if user_signed_in?
  end

  def index
    redirect_to welcome_path unless user_signed_in?
    redirect_to configurations_path unless ProjectConfiguration.configured?
    @git = Git.new
  end
end
