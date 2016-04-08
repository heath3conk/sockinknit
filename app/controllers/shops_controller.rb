get '/shops' do 
  if request.xhr?
    erb :'/shops/_address_form', layout: false
  else 
    erb :'/shops/_address_form'
  end
end

post '/shops' do
  erb :'/shops/find'
end