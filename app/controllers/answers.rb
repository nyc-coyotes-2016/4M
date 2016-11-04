post '/answers' do
  if logged_in
    @new_answer = Answer.new(params[:answer])
    if @new_answer.valid?
      @new_answer.save
      redirect "/questions/#{params[:answer][:question_id]}"
    else
      @errors = @new_answer.errors.full_messages
      redirect "/questions/#{params[:answer][:question_id]}"
    end
  else
    @errors = ["You need to be logged in to post an answer"]
    erb :'/sessions/login'
  end
end
