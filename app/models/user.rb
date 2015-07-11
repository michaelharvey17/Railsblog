class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  validates :password, confirmation: true
  validates_uniqueness_of :username
  validates_presence_of :username
  validates :password, presence: true, on: :create
 
end
