module SessionsHelper
  # save userID in session
  def login user
  	session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
  	if session[:user_id]
  	  @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
  	!current_user.nil?
  end

  #delete session with id = user_id
  def log_out
  	session.delete(:user_id)
  	@current_user = nil
  end
end
