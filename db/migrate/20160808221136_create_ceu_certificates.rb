class CreateCeuCertificates < ActiveRecord::Migration
  def change
    create_table :ceu_certificates do |t|
      t.belongs_to :ceu, index: true, foreign_key: true
      t.belongs_to :certificate, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
