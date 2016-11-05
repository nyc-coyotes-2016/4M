post "/answers" do
  @new_answer = Answer.new(params[:answer])
  if logged_in
    if @new_answer.valid?
      @new_answer.save
      if request.xhr?
        p "*********************************"
        p "*********************************"
        p "*********************************"
        p "*********************************"
        p "*********************************"
       p "javascript"
        content_type :json
        @new_answer.to_json
      else
        p "*********************************"
        p "*********************************"
        p "*********************************"
        p "*********************************"
        p "*********************************"
       p "no javascript"
        redirect "/questions/#{params[:question_id]}"
      end
    else
      @errors = @new_comment.errors.full_messages
      redirect "/questions/#{params[:question_id]}"
    end
  end
end
