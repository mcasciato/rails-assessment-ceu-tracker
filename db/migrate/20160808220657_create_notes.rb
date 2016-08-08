class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content
      t.belongs_to :user_id, index: true, foreign_key: true
      t.belongs_to :ceu_id, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
