class CreateServings < ActiveRecord::Migration[5.2]
  def change
    create_table :servings do |t|
      t.integer :meal_category
      t.references :school_meal, index: true
      t.references :food_supply, index: true
      t.timestamps
    end
  end
end
