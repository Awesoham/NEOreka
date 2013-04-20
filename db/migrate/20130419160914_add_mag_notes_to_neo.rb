class AddMagNotesToNeo < ActiveRecord::Migration
  def change
    add_column :neos, :magnitude, :integer
    add_column :neos, :notes, :text
  end
end
