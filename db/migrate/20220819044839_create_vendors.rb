class CreateVendors < ActiveRecord::Migration[7.0]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :shipping_name
      t.float :shipping_price

      t.timestamps
    end
  end
end
