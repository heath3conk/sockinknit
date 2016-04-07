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

# route handlers dealing with the collection
# get '/users/:id/projects' do
#   user = User.find(params[:id])
#   @projects = user.projects
#   erb :'projects/index'
# end


# # route handlers dealing with a specific entry
# before '/projects/:id' do
#   pass if request.path_info.match /new/
#   @project = find_and_ensure_project(params[:id])
# end

# get '/projects/:id' do
#   erb :'projects/show'
# end

# put '/projects/:id' do
#   @project.assign_attributes(params[:project])

#   if @project.save
#     redirect "projects/#{@project.id}"
#   else
#     @errors = @project.errors.full_messages
#     erb :'projects/edit'
#   end
# end

# delete '/projects/:id' do
#   @project.destroy
#   redirect '/'
# end

# get '/projects/:id/edit' do
#   @project = find_and_ensure_project(params[:id])
#   erb :'projects/edit'
# end
