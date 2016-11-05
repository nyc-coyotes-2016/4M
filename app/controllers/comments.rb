post '/comments' do
  @new_comment = Comment.new(params[:comment])

  if @new_comment.valid?
    @new_comment.save
    if request.xhr?
      content_type :json
       @new_comment.to_json
    else
      redirect "/questions/#{params[:question_id]}"
    end
  else
    @errors = @new_comment.errors.full_messages
    redirect "/questions/#{params[:question_id]}"
  end

end
