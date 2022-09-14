class RenaneColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :user_id, :user
    rename_column :posts, :user_id, :user
    rename_column :likes, :user_id, :user
  end
end
