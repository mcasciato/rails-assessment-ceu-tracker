class AddLocationToCeus < ActiveRecord::Migration
  def change
    add_column :ceus, :location, :string
  end
end
