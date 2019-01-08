class UserController < ApplicationController
  def index
    @users = User.all
  end

  def show
  	
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new user_params
    if @user.save
      flash[:success] = "Register success"
      redirect_to users_path
    else
      flash[:success] = "Register failed"
      render :new
    end
  end

  def edit
  	
  end

  def update
  	
  end

  def destroy
  	
  end
  def user_params
    params.require(:user).permit :name, :email
  end
end
