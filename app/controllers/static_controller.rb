class StaticController < ApplicationController

  def welcome

  end

  def index
    redirect_to welcome_path unless user_signed_in?
    @git = Git.new
  end
end
