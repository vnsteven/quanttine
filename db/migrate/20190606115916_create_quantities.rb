class CreateQuantities < ActiveRecord::Migration[5.2]
  def change
    create_table :quantities do |t|
      t.integer :quantity
      t.references :school, index: true
      t.references :food_supply, index:true
      t.timestamps
    end
  end
end
