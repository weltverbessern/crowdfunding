class AddNames < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :name, :product_name
    add_column :orders, :first_name, :string
    add_column :orders, :last_name, :string
  end
end
