class UsersController < ApplicationController
  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)

    if @user.save
      auto_login(@user)
      UserMailer.welcome_email(@user).deliver_later # or deliver_now
      redirect_to projects_url ## path?
      flash[:notice] = "Account created!"
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
