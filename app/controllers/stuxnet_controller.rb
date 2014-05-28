class StuxnetController < ApplicationController
  def deploy
    @git = Git.new

    if @git.pull('/tmp/prod')
      redirect_to "/"
    else
      fail
    end
  end
end
