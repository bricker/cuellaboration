class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_login
  
  #--------------------
  
  def check_login
    if !current_user
      session[:return_to] = request.fullpath
      redirect_to(login_path, alert: "Please login first") and return false
    end
  end

  #--------------------
  
  def current_user
    begin
      @current_user ||= Collaborator.active.find(cookies['current_user_id'])
    rescue ActiveRecord::RecordNotFound
      cookies['current_user_id'] = nil
      @current_user = nil
    end
  end
  
  helper_method :current_user
end
