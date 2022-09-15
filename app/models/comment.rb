class Comment < ApplicationRecord
  belongs_to :author, class_name: :User
  belongs_to :post

  after_save :update_comment_counters

  private

  def update_comment_counters
    post.increment!(:commentsCounter)
  end
end
