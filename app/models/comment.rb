class Comment < ApplicationRecord
  belongs_to :author, class_name: :User
  belongs_to :post

  validates :text, presence: true, length: { minimum: 5, maximum: 200 }

  after_save :update_comment_counters

  private

  def update_comment_counters
    post.increment!(:comments_counter)
  end
end
