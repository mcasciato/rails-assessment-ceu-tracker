class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.string :type
      t.integer :ceu_id
      t.timestamps null: false
    end
  end
end
