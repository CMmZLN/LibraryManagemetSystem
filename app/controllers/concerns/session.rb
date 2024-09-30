module Session
  protected

  def require_login
    redirect_to login_path and return unless session[:user_id].present?
  end 

end