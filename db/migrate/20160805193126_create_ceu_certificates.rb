class CreateCeuCertificates < ActiveRecord::Migration
  def change
    create_table :ceu_certificates do |t|

      t.timestamps null: false
    end
  end
end
