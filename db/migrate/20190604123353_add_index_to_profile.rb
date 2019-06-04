class AddIndexToProfile < ActiveRecord::Migration[5.2]
  def change
    add_reference :profiles, :school, foreign_key: true
  end
end
