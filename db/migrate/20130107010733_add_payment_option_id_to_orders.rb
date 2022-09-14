class AddPaymentOptionIdToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :payment_option_id, :integer
  end
end
