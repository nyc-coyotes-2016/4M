post '/comments' do
  if logged_in
      @new_comment = Comment.new(params[:comment])
    end

  if @new_comment.valid?
    @new_comment.save
    redirect '/'
  else
    erb ':/comments'
  end
end
