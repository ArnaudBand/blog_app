class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :text, presence: true
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id

  after_save :update_counters

  def all_comments
    comments.includes(:author).order(created_at: :desc)
  end

  def most_recent_comments
    all_comments.limit(5)
  end

  private

  def update_counters
    author.increment!(:posts_counter)
  end
end
