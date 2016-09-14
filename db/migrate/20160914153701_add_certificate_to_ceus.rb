class AddCertificateToCeus < ActiveRecord::Migration
  def change
    add_column :ceus, :certificate, :string
  end
end
