class SessionsController < ApplicationController
  before_action :check_login_url,  only: [:new]

  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  	  #if true save iduser in session and direct to url user/welcome 
      #and user is admin direct to list users
      if user.admin?
  	    log_in(user)
        if params[:session][:remember_me] == '1'
          remember(user)
        else
          forget(user)
        end
        flash[:success] = 'Welcome to demo' 
        redirect_to users_path
      else
        log_in(user)
        if params[:session][:remember_me] == '1'
          remember(user)
        else
          forget(user)
        end
        flash[:success] = 'Welcome to demo' 
        redirect_back_or user  
      end
  	else
  	  #show the messege if error end show user/new to login again
      flash.now[:danger] = 'Invalid email or password'
      render 'new'
  	end
  end

  def destroy
  	log_out
  	redirect_to root_path
  end

  private 

    def check_login_url
      if logged_in?
        flash[:warning] = 'You are already login'
        redirect_to user_path(current_user)
      end
    end
end
