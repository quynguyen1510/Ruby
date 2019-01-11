module SessionsHelper
  # save userID in session
  def log_in user
  	session[:user_id] = user.id
  end

  # Returns the current logged-in user from the session[:user_id].
  def current_user
  	if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
  	current_user.present?
  end

  #delete infor in cookies
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  #delete session with id = user_id
  def log_out
    forget(current_user)
  	session.delete(:user_id)
  	@current_user = nil
  end

  #Save infor in cookies
  def remember user
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  #call back url in store after login if url is exist
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  #save url user trying to access
  def store_location
    session[:return_to] = request.fullpath
  end
end
