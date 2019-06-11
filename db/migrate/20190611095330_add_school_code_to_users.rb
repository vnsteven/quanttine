class AddSchoolCodeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :school_code, :integer
  end
end
