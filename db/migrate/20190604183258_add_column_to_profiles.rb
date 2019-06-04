class AddColumnToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :active, :boolean
  end
end
