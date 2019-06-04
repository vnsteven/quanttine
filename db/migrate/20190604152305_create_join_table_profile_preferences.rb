class CreateJoinTableProfilePreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_profile_preferences do |t|

      t.references :profile, index: true
      t.references :preference, index: true
      t.timestamps
    end
  end
end
