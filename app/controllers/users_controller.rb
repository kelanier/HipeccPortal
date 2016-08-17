class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You signed up successfully"
      flash[:color] = "valid"
    else
      flash[:notice] = "" #I like the functionality but am not using it at this time
      flash[:color] = "invalid"
    end

    render "new"
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation, :organization, :address_street, :address_city, :address_state, :address_country, :email, :commit)
  end

  before_filter :save_login_state, :only => [:new, :create]


end
