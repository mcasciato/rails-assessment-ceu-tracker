class CreateCeuCertificates < ActiveRecord::Migration
  def change
    create_table :ceu_certificates do |t|
      t.integer :ceu_id
      t.integer :certificate_id
      t.boolean :completed, default: false 
      t.timestamps null: false
    end
  end
end
