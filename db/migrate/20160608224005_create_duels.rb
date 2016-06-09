class CreateDuels < ActiveRecord::Migration
  def change
    create_table :duels do |t|
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
