class SessionsController < ApplicationController
  # Create a new session for a login.
  def new
    @user = User.new
  end
  # Actual action of loggin in.
  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(projects_path, notice: 'Login successful!')
      # redirect_back_or_to Remebers the page you were on before login and takes you there
      # to this without sorcery, you'd need to store the info in a cookie through the session hash
      # Anytime you want to be able to access a cookie, it's through the sessions hash.
   else
      flash.now[:alert] = 'Login failed'
      render action: :new
    end
  end
  # Log out
  def destroy
    logout
    redirect_to projects_path
  end
end
