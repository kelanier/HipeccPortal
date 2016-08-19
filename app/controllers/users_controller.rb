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

  def edit
    @user = User.find session[:user_id]
  end

  def update
    @user = User.find session[:user_id]
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html {redirect_to @user, notice: 'User was successfully updated.'}
      else
        format.html {render action: "edit"}
      end
    end
  end

  def show
    @user = User.find session[:user_id]
  end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation, :organization, :address_street, :address_city, :address_state, :address_zip, :address_country, :email, :commit)
  end

  before_filter :save_login_state, :only => [:new, :create, :update]


end
