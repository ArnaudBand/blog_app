class Comment < ApplicationRecord
  belongs_to :author, class_name: :User
  belongs_to :post

  validates :text, presence: true, length: { minimum: 5, maximum: 200 }

  after_save :update_comment_counters
  after_destroy :update_comment_counters

  private

  def update_comment_counters
    post.update(comments_counter: post.comments.count)
  end
end
