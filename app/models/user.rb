class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id

  validates :name, presence: true, length: { maximum: 30 }
  validates :bio, presence: true
  validates :photo, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_initialize do |user|
    user.posts_counter = 0
  end

  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
