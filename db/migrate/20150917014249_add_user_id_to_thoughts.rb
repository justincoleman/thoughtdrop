class AddUserIdToThoughts < ActiveRecord::Migration
  def change
    add_column :thoughts, :user_id, :integer
    add_index :thoughts, :user_id
  end
end
