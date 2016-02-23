class SessionsController < ApplicationController
  # Create a new session for a login.
  def new
    @user = User.new
  end
  # Actual action of loggin in.
  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(:users, notice: 'Login succesfful!')
      # redirect_back_or_to Remebers the page you were on before login and takes you there
   else
      flash.now[:alert] = 'Login failed'
      render action: :new
    end
  end
  # Log out
  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end
end
