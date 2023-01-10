class AddPaymentFieldsToOrders < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :stripe_customer_id, :payment_ref
    add_column :orders, :payment_mode, :string
    add_column :orders, :payment_provider, :string
    add_column :orders, :payment_status, :string
  end
end
