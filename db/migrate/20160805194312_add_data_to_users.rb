class AddDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :occupation, :string
  end
end
