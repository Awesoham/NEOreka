class RemoveRaDecFromNeo < ActiveRecord::Migration
  def up
  	remove_column :neos, :ra
  	remove_column :neos, :dec
  end

  def down
  end
end
