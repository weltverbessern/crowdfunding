class RenamePaymentOptions < ActiveRecord::Migration[7.0]
  def change
    rename_table :payment_options, :incentives
    rename_column :orders, :payment_option_id, :incentive_id
  end
end
