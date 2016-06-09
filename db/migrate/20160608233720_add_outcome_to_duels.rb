class AddOutcomeToDuels < ActiveRecord::Migration
  def change
    add_column :duels, :outcome, :text
  end
end
