class CreateDefaultValue < ActiveRecord::Migration[7.0]
  def up
    change_column_value :users, postsCounter, :integer, default: 0
    change_column_value :users, commentsCounter, :integer, default: 0
    change_column_value :posts, commentsCounter, :integer, default: 0
  end

  def down
    change_column_value :users, postsCounter, :integer, default: nil
    change_column_value :users, commentsCounter, :integer, default: nil
    change_column_value :posts, commentsCounter, :integer, default: nil
  end
end
