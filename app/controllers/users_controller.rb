class UsersController < ApplicationController

  def index
    viewing_user = User.find session[:user_id]
    if viewing_user.username == ENV["ENNOVAR_HPC_ACCOUNT_USERNAME"]
      @users = User.all
      @admin_user = true
    else
      @admin_user = false
    end
  end


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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "Account update successful."
      flash[:color] = "valid"
    else
      flash[:notice] = "Account update failed!" #I like the functionality but am not using it at this time
      flash[:color] = "invalid"
    end
    render "edit"
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to @user }
      format.json { head :ok }
    end
  end




  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation, :organization, :address_street, :address_city, :address_state, :address_zip, :address_country, :email, :commit)
  end

  def updated_user_params
    params.require(:user).permit(:password, :password_confirmation, :organization, :address_street, :address_city, :address_state, :address_zip, :address_country, :email, :commit)
  end

  before_filter :save_login_state, :only => [:new, :create]


end
