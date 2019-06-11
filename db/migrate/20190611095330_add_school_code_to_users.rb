class AddSchoolCodeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :school_code, :string
  end
end
