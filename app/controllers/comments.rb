post '/comments' do
  @new_comment = Comment.new(params[:comment])

  if @new_comment.valid?
    @new_comment.save
    redirect "/questions/#{params[:question_id]}"
  else
    @errors = @new_comment.errors.full_messages
    redirect "/questions/#{params[:question_id]}"
  end
end
