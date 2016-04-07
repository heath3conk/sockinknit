get '/projects' do
  erb :'/projects/new'
end

post '/projects' do
  @user = User.find(session[:id])
  p @user
  @recipient = @user.recipients.find_by(params[:recipient][:name])    
  @project = Project.new(params[:project])
  @project[:knitter_id] = @user.id
  @recipient ? @project[:recipient_id] = @recipient.id : @project[:recipient_id] = 1
  if @projects.save
    redirect "/projects/#{@project.id}"
  else
    @errors = @project.errors.full_messages
    erb :'/projects/new'
  end
end

get '/projects/:id' do 
  @project = Project.find(params[:id])
  erb :'/projects/show'
end