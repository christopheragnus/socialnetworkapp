class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private 

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id]) 
    end
  end
  helper_method :current_user 

  # adding current_user method to make it available to all controllers/views
  
  #double pipe equals is an operator that assigns a value, 
  # much like = or our classic assignment operator, 
  #but will only complete the assignment if the left 
  #side of our operation returns false or nil.
end
