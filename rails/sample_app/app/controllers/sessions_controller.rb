class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  	  #if true save iduser in session and direct to url user/welcome
  	  log_in(user)
      flash[:success] = 'Welcome to demo' 
  	  redirect_to current_user	
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
end
