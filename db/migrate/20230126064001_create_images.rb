class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.string :locale
      t.string :key

      t.timestamps
    end
  end
end
