get "/" do
  if logged_in?
    redirect "/users/#{current_user.id}"
  else
    redirect "/session"
  end
end
