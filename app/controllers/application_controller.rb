class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_user
    user=User.find(session[:user_id])
  end
end
