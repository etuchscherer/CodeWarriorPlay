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
    config = ProjectConfiguration.first
    Github.new_synchronizer({
      owner: config.owner,
      name: config.name,
      destination: config.destination,
      source: config.source  
    }).updated?
  end
end
