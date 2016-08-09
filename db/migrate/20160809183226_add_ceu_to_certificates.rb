class AddCeuToCertificates < ActiveRecord::Migration
  def change
    add_reference :certificates, :ceu, index: true, foreign_key: true
  end
end
