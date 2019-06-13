class CustomFailureController < Devise::FailureApp
  def redirect_url
     new_user_session_url(subdomain: 'secure')
  end

  def respond
    if http_auth?
      http_auth
    else
      redirect_to root_path, notice: "connection failed"
    end
  end
end
