class AddStripeCustomerIdToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :stripe_customer_id, :string
  end
end
