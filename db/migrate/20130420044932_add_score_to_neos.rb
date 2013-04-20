class AddScoreToNeos < ActiveRecord::Migration
  def change
    add_column :neos, :score, :integer
  end
end
