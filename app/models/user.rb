class User < ActiveRecord::Base
  has_many :posts
  validates :password, confirmation: true
  validates_uniqueness_of :email, :username
  validates_presence_of :username, :email, :password, :lname, :fname, :password_confirmation

end
