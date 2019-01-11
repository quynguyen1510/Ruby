class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :index]
  before_action :correct_user, only: [:show, :edit, :update]
  before_action :admin_user,  only: [:destroy, :index]
  
  def index
    @users = User.paginate(page: params[:page]) 
  end

  def new
  	@user = User.new
  end

  def edit
    @user = User.find(params[:id])  
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile updated'
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      flash[:success] = 'Signup Complete'
  	  redirect_to login_path
  	else
  	  render 'new'
  	end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User detroyed'
    redirect_to users_path 
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    #check user login when try to enter url the orther site without login
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_path
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      unless @user == current_user
        flash[:danger] = "You not have access"
        redirect_to(root_path) 
      end
    end

    def admin_user
      unless current_user.admin?
        flash[:danger] = "You not have access"
        redirect_to(root_path)  
      end
    end
end
