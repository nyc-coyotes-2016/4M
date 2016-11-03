class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
  has_many :questions
  has_many :answers
  has_many :votes
  has_many :comments
end
