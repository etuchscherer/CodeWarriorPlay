class StaticController < ApplicationController
  def index
    @git = Git.new
  end
end
