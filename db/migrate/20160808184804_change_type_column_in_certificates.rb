class ChangeTypeColumnInCertificates < ActiveRecord::Migration
  def change
    rename_column :certificates, :type, :classification
  end
end
