class SessionsController < ApplicationController
  skip_before_filter :check_login
  
  def new
    redirect_to root_path if current_user
  end
  
  #------------------------
  
  def create
    if user = Collaborator.authenticate(email: params[:email], password: params[:password])
      if params[:remember]
        cookies.permanent['current_user_id'] = user.id
      else
        cookies['current_user_id'] = user.id
      end
      
      redirect_to session[:return_to] || root_path, notice: "Logged in"
    else
      redirect_to login_path, alert: "Incorrect login information"
    end
  end

  #------------------------
  
  def destroy
    @current_user = nil
    cookies['current_user_id'] = nil
    redirect_to login_path, notice: "Logged out"
  end
end
