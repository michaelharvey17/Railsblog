class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, class_name: "Post",
                      foreign_key: "post_id"
  validates :content, presence: true
  belongs_to :main_post, class_name: "Post"
end
