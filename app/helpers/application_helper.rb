module ApplicationHelper

  def sign_in_sign_out_button
    if user_signed_in?
      link_to 'Sign Out', destroy_user_session_path, method: :delete
    else
      link_to 'Sign In', new_user_session_path
    end
  end

  def settings_button
    if ProjectConfiguration.configured? && user_signed_in?
      link_to 'Settings', project_configurations_path
    end
  end

  def configured_project_is_current
  	remote = Github::Commits.new({owner: 'etuchscherer', repo: 'play'})
  	local  = Git.new

  	remote.fetch

  	remote.last_commit_sha === local.local_v('/tmp/prod')
  end
end
