class CreateCeus < ActiveRecord::Migration
  def change
    create_table :ceus do |t|
      t.string :title
      t.date :date
      t.integer :duration
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
