class AddStripeSubscriptionIdToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :stripe_subscription_id, :string
  end
end
