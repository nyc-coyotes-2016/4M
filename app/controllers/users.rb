get '/users/register' do
  erb :'/users/register'
end

post '/users' do
  @user = User.new(params[:user])

  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    redirect '/users/register'
  end
end

get '/login' do
  erb :'/login'
end

post '/login' do
  @user = User.find_by(username: params[:username])
  p @user

  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @error = ["Your username and/or password were not found"]
    erb :'/login'
  end
end
