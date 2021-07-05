class UsersController < ApplicationController
  before_action :only_offlines, only: [:new, :create, :log_in]
  before_action :only_onlines, only: [:show, :log_out]
  before_action :only_users, only: [:edit, :update]
  before_action :only_admins, only: [:destroy]
  before_action :set_user, only: [:destroy, :edit, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to #user profile
    else
      back_or_root
    end
  end

  def destroy
    if @user.delete
      redirect_to root_url
    else
      back_or_root
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to #user profile
    else
      back_or_root
    end
  end

  def show
  end

  def log_in
    @user = User.find_by(email: params[:login][:email])

    if @user && @user.authenticate(params[:login][:password])
      #success message
      back_or_root 
    else
      #err message
      back_or_root
    end
  end

  def log_out
    logout
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def only_onlines
    back_or_root unless logged_in?
  end

  def only_users
    back_or_root unless current_user? User.find(params[:id])
  end

  def only_admins
    back_or_root unless current_user.admin?
  end

  def only_offlines
    back_or_root if logged_in?
  end
end
