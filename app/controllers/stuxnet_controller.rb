class StuxnetController < ApplicationController
  def deploy
  	@synchronizer = Github.new_synchronizer

  	if @synchronizer.pull
  		redirect_to '/'
  	else
  		fail
  	end
  end
end
