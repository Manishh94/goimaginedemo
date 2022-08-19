class AddVendorIdToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :vendor_id, :integer
  end
end
