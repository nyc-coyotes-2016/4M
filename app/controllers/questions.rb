get '/questions' do
  @questions = Question.all
  erb :index
end

get '/questions/new' do
  erb :'/questions/new'
end

get '/questions/:id' do
  erb :'/questions/show'
end

post '/questions' do
  new_question = Question.new(params[:Question])
  if new_question.valid?
    new_question.save
    redirect '/'
  else
    erb ':/questions/new'
  end
end




