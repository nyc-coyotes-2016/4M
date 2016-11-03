get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])

  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    p @errors
    erb :'/users/new'
  end
end

get '/sessions/login' do
  erb :'/sessions/login'
end

post '/sessions/login' do
  @user = User.find_by(username: params[:username])
  p @user

  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = ["Your username and/or password were not found"]
    erb :'/sessions/login'
  end

end
delete '/sessions/logout' do
  session.clear
  redirect '/'
end

get '/users/:id/show' do
  erb :'/users/show'
end
