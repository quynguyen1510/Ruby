module SessionsHelper
  # save userID in session
  def log_in user
  	session[:user_id] = user.id
  end

  # Returns the current logged-in user from the session[:user_id].
  def current_user
  	if session[:user_id]
  	  @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
  	current_user.present?
  end

  #delete session with id = user_id
  def log_out
  	session.delete(:user_id)
  	@current_user = nil
  end

  #call back url in store after login if url is exist
  def redirect_back_or(default)
    # redirect_to(session[:forwarding_url] ||default)
    # session.delete(:forwarding_url)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  #save url user trying to access
  def store_location
    # if request.get?  
    #   session[:forwarding_url] = request.original_url 
    # end
    session[:return_to] = request.fullpath
  end
end
