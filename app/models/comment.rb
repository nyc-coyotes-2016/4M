class Comment < ActiveRecord::Base
  validates_presence_of :body
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :votable
  belongs_to :user
end
