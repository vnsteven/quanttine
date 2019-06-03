class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :school_type
      t.string :city
      t.string :street_address
      t.string :zipcode
      t.string :phone_number
      t.string :email
      t.timestamps
    end
  end
end
