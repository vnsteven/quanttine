class CreateJoinTablePreferenceFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_preference_foods do |t|
      t.references :preference, index: true
      t.references :food_supply, index: true
      t.timestamps
    end
  end
end
