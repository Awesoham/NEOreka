class AddNeoIdToObservations < ActiveRecord::Migration
  def change
    add_column :observations, :neo_id, :integer
  end
end
