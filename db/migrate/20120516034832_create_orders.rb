class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :purchase_count

      t.timestamps
    end
  end
end
