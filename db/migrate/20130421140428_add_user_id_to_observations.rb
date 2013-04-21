class AddUserIdToObservations < ActiveRecord::Migration
  def change
    add_column :observations, :user_id, :integer
  end
end
