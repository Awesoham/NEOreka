class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.float :ra
      t.float :dec

      t.timestamps
    end
  end
end
