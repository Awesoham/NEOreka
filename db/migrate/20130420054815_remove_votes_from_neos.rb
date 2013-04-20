class RemoveVotesFromNeos < ActiveRecord::Migration
  def up
	remove_column :neos, :votes
  end

  def down
  end
end
