class CreateSchoolMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :school_meals do |t|
      t.datetime :date
      t.references :school, index: true
      t.timestamps
    end
  end
end
