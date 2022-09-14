class AddStripeCustomerIdToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :stripe_customer_id, :string
  end
end
