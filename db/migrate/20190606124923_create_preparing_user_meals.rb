class CreatePreparingUserMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :preparing_user_meals do |t|
      t.integer :serving_size
      t.references :user_meal, index: true
      t.references :serving, index: true
      t.timestamps
    end
  end
end
