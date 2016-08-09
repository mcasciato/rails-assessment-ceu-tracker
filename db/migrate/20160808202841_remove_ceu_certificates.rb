class RemoveCeuCertificates < ActiveRecord::Migration
  def change
    drop_table :ceu_certificates
  end
end
