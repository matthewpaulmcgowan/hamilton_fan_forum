class AddCompetitorToDuels < ActiveRecord::Migration
  def change
    add_column :duels, :competitor, :text
  end
end
