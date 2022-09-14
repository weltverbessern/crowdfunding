class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :address_one, :address_line1
    rename_column :orders, :address_two, :address_line2
  end
end
