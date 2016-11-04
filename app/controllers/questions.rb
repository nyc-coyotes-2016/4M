get '/questions' do
  @questions = Question.all
  erb :index
end

get '/questions/new' do
  if logged_in
    erb :'/questions/new'
  else
    redirect '/sessions/login'
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'/questions/show'
end

post '/questions' do
  new_question = Question.new(params[:question])
  if new_question.valid?
    new_question.save
    redirect '/'
  else
    erb ':/questions/new'
  end
end




