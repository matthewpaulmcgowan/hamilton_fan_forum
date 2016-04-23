class ChangeNameOfUsersColumn < ActiveRecord::Migration
  def change
    rename_column :users, :LMM_natl_treasure, :lmm_national_treasure
  end
end
