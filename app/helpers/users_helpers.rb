helpers do
  def current_user
    User.find(session[:user_id])
  end

  def logged_in?
    session[:user_id]
  end

  def logout
    session[:user_id] = nil
  end

end
