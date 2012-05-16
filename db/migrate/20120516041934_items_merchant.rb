class ItemsMerchant < ActiveRecord::Migration
  def change
    create_table :items_merchants, :id=>false do |t|
      t.integer :item_id
      t.integer :merchant_id
    end
  end
end
