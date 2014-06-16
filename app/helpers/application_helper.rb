module ApplicationHelper

  def sign_in_sign_out_button
    if user_signed_in?
      link_to 'Sign Out', destroy_user_session_path, method: :delete
    else
      link_to 'Sign In', new_user_session_path
    end
  end
end
