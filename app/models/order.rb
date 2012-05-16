require 'csv'
class Order < ActiveRecord::Base
  attr_accessible :purchase_count, :purchaser_id, :merchant_id, :item_id
  
  validates_presence_of :purchase_count, :purchaser_id, :merchant_id, :item_id
  
  belongs_to :merchant
  belongs_to :item
  belongs_to :purchaser
  
  before_save do
    self.total = self.item.price*self.purchase_count
  end
  
  def self.import(purchaser_name, item_description, item_price, purchase_count, merchant_address, merchant_name)
    puts "---#{purchaser_name}, #{item_description}, #{item_price}, #{purchase_count}, #{merchant_address}, #{merchant_name}---"
    purchaser = Purchaser.find_or_create_by_name(:name=>purchaser_name)
    item = Item.find_or_create_by_description(:description=>item_description, :price=> item_price)
    # merchant = Merchant.exists?(:name=>merchant_name, :address=>merchant_address)
    # merchant = Merchant.new(:name=>merchant_name, :address=>merchant_address)
    # merchant.save!
    merchant = Merchant.find_or_create_by_name_and_address(merchant_name, merchant_address)
    # merchant = Merchant.find_or_initialize_by_name_and_address(:name=>merchant_name, :address=>merchant_address).save!
    unless merchant.items.include?(item)
      merchant.items << item
      merchant.save!
    end    
    Order.create(:purchase_count=> purchase_count, :purchaser_id=>purchaser.id, :merchant_id=>merchant.id, :item_id=>item.id) unless Order.exists?(:purchase_count=> purchase_count, :purchaser_id=>purchaser.id, :merchant_id=>merchant.id, :item_id=>item.id)
  end
  
  def self.import_csv(csv_data)
    csv_file = csv_data.read
    total = 0
    n=0
    CSV.parse(csv_file,{ :col_sep => "\t"}) do |row|
      n += 1
      next if n==1
      puts "----#{row}-----"
      order = Order.import(row[0], row[1], row[2], row[3], row[4], row[5])
      total += order ? order.total : 0
    end
    total
  end
  
end
# == Schema Information
#
# Table name: orders
#
#  id             :integer         not null, primary key
#  purchase_count :integer
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#  merchant_id    :integer
#  item_id        :integer
#  purchaser_id   :integer
#

