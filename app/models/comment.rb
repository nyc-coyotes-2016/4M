class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :votable
  belongs_to :user
end
