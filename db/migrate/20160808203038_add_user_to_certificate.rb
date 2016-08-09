class AddUserToCertificate < ActiveRecord::Migration
  def change
    add_column :certificates, :user_id, :integer
  end
end
