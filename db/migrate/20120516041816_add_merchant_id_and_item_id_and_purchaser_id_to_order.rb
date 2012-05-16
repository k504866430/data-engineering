class AddMerchantIdAndItemIdAndPurchaserIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :merchant_id, :integer
    add_column :orders, :item_id, :integer
    add_column :orders, :purchaser_id, :integer
  end
end
