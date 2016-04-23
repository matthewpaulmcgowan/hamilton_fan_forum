class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :viewed_hamilton, :integer, default: 0
    add_column :users, :listened_to_soundtrack, :integer, default: 0
    add_column :users, :favorite_actor, :string
    add_column :users, :favorite_song, :string
    add_column :users, :LMM_natl_treasure, :integer, default: 0
    add_column :users, :favorite_Daveed_Diggs_character, :string
    add_column :users, :ham_or_burr_have_better_songs, :string
  end
end
