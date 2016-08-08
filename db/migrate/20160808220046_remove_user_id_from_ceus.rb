class RemoveUserIdFromCeus < ActiveRecord::Migration
  def change
    remove_column :ceus, :user_id, :integer
  end
end
