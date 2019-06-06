class CreateUserMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :user_meals do |t|
      t.references :profile, index: true
      t.references :serving, index: true
      t.timestamps
    end
  end
end
