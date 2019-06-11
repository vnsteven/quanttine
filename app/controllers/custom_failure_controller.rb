class CustomFailureController < Devise::FailureApp
  def redirect_url
     new_user_session_url(subdomain: 'secure')
  end

  def respond
    if http_auth?
      flash[:success] = "no"
      http_auth
    else
      redirect_to root_path
    end
  end
end
