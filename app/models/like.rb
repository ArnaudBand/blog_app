class Like < ApplicationRecord
  belongs_to :author, class_name: :User
  belongs_to :post, class_name: :Post

  after_save :update_like_counters

  private

  def update_like_counters
    post.increment!(:likes_counter)
  end
end
