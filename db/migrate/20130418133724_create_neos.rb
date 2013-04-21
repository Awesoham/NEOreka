class CreateNeos < ActiveRecord::Migration
  def change
    create_table :neos do |t|
      t.float :ra
      t.float :dec
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
