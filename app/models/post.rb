class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, class_name: "Post",
                      foreign_key: "post_id",
                      dependent: :destroy

  belongs_to :main_post, class_name: "Post"

  scope :created_today, -> {
    where('created_at between ? and ?', Time.now-1.day, Time.now)
  }
end
