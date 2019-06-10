class AddStripePlanIdToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :stripe_plan_id, :string
  end
end
