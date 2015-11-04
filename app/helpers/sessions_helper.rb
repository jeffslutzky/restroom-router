module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def user_signed_in?
    
  end




end