module SessionHelper

  def sign_in(user)
    session[:user_id] = user.id
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    if !session[:user_id].nil?
      @current_user ||= User.find(session[:user_id])
    end
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    self.current_user = nil
    session.delete(:user_id)
  end

end
