class AddIndexToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_reference :admins, :school, foreign_key: true
  end
end
