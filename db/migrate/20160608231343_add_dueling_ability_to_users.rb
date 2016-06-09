class AddDuelingAbilityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dueling_ability, :integer, default: 45
  end
end
