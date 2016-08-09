class RemoveRelationsFromCertificates < ActiveRecord::Migration
  def change
    remove_column :certificates, :user_id, :integer
    remove_column :certificates, :ceu_id, :integer
  end
end
