class CreatePreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :preferences do |t|
      t.string :name
      t.integer :category

      t.timestamps
    end
  end
end
