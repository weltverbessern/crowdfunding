class RemoveOldFieldsFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :token, :string
    remove_column :orders, :transaction_id, :string
    remove_column :orders, :status, :string
    remove_column :orders, :number, :string
    remove_column :orders, :shipping, :decimal
    remove_column :orders, :tracking_number, :string
    remove_column :orders, :expiration, :date
  end
end
