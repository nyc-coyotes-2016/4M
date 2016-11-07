post '/votes/new' do
  if logged_in
    # p params[:question_id]
    new_vote = Vote.new(value: 1, user_id: current_user.user_id, votable_id: params[:question_id])
  end
end
