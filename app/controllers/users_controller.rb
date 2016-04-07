get '/users/new' do
  @user
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])
  @recipient = Recipient.create(params[:recipient])
  # future release: if errors on recipient.save, show a message
  #   for now, just try to save it and don't worry if it fails
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  if !logged_in? || @user != current_user
    redirect '/'
  else
    erb :'/users/show' 
  end
end
