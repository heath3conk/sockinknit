get "/session" do
  erb :"session"
end

post "/session" do
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.authenticate?(params[:user][:password])
    session[:user_id] = @user.id
    redirect "/"
  else
    erb :"session"
  end
end

delete "/session" do
  session.delete(:user_id)
  redirect "/"
end
