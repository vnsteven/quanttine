class AddSchoolCodeToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :school_code, :integer
  end
end
