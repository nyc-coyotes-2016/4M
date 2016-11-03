User.delete_all
Question.delete_all
Answer.delete_all
Comment.delete_all
Vote.delete_all

3.times do
  user = User.create!(username: Faker::Internet.user_name,
                       email: Faker::Internet.email,
                       password: Faker::Internet.password(8))

  question = Question.create!(title: Faker::Hipster.sentence + "?",
                              body: Faker::Hipster.paragraph,
                              user_id: user.id)

  best_answer = Answer.create!(body: Faker::Hacker.say_something_smart,
                          question_id: question.id,
                          user_id: user.id,
                          best_answer: true)

  answer = Answer.create!(body: Faker::Hipster.paragraph,
                          question_id: question.id,
                          user_id: user.id,
                          best_answer: false)
  2.times do
    answer_comment = Comment.create!(body: Faker::ChuckNorris.fact,
                              commentable_type: "Answer",
                              user_id: user.id)

    question_comment = Comment.create!(body: Faker::ChuckNorris.fact,
                              commentable_type: "Question",
                              user_id: user.id)
  end

  3.times do
    comment_vote = Vote.create!(value: 1,
                        user_id: user.id,
                        votable_type: "Comment")

    question_vote = Vote.create!(value: 1,
                        user_id: user.id,
                        votable_type: "Question")

    answer_vote = Vote.create!(value: 1,
                        user_id: user.id,
                        votable_type: "Answer")
  end
end

