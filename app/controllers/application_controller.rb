class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # Override the sorcery not_authenticated method so redirect to the log in page. 
  def not_authenticated
    redirect_to login_path, alert: "Please log in to continue"
  end
end
