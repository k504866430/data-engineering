require 'spec_helper'

describe Order do
  it {should validate_presence_of :purchase_count}
  
  it {should belong_to :purchaser}
  it {should belong_to :item}
  it {should belong_to :merchant}
  
  describe ".import" do
    let (:fresh_order) do
      ["Snake Plissken",	"$10 off $20 of food",	"10.0",	"2",	"987 Fake St",	"Bob's Pizza"]
    end
    let (:new_order) do
      Purchaser.create(:name=>"Snake Plissken")
      Merchant.create(:address=>"987 Fake St", :name=>"Bob's Pizza")
      Item.create(:description=>"$10 off $20 of food", :price=> 10.00)
      ["Snake Plissken",	"$10 off $20 of food",	"10.0",	"3",	"987 Fake St",	"Bob's Pizza"]
    end
    it "should create purchaser, merchant, item and order for a new row" do
      order = Order.import(fresh_order[0], fresh_order[1], fresh_order[2], fresh_order[3], fresh_order[4], fresh_order[5])
      Purchaser.count.should == 1
      Item.count.should == 1
      Merchant.count.should == 1
      Order.count.should == 1
      order.purchaser.name.should == "Snake Plissken"
      order.merchant.name.should == "Bob's Pizza"
      order.merchant.address.should == "987 Fake St"
      order.item.description.should == "$10 off $20 of food"
      order.item.price.should == 10.0
      order.purchase_count.should == 2 
      order.total.should == 20.0
    end
    it "should create new order and use existing purchaser, merchant and item" do
      Order.import(new_order[0], new_order[1], new_order[2], new_order[3], new_order[4], new_order[5])
      Purchaser.count.should == 1
      Item.count.should == 1
      Merchant.count.should == 1
      Order.count.should == 1
    end
    it "should ignore duplicates" do
      Order.import(fresh_order[0], fresh_order[1], fresh_order[2], fresh_order[3], fresh_order[4], fresh_order[5])
      Purchaser.count.should == 1
      Item.count.should == 1
      Merchant.count.should == 1
      Order.count.should == 1
      Order.import(fresh_order[0], fresh_order[1], fresh_order[2], fresh_order[3], fresh_order[4], fresh_order[5])
      Purchaser.count.should == 1
      Item.count.should == 1
      Merchant.count.should == 1
      Order.count.should == 1
    end
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

