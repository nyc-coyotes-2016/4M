post '/answers' do
  if logged_in
    @new_answer = Answer.new(params[:answer])
  end

  if @new_answer.valid?
    @new_answer.save
    redirect '/'
  else
    erb ':/answers'
  end
end
