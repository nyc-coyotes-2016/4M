post '/votes/new' do
  @new_vote = Vote.new(params[value: 1, user_id: current_user, votable: '#{:question_id}' ])
end
