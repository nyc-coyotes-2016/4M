post '/votes/new' do
  if logged_in
    new_vote = Vote.new(value: 1, user_id: current_user.id, votable_id: params[:votable_id], votable_type: params[:votable_type])
    # question = Question.find(params[:votable_id])
    if new_vote.valid?
      new_vote.save
      redirect "/questions/#{params[:votable_id]}"
    end
  end
end
