class Item < ActiveRecord::Base
  attr_accessible :description, :price
  
  validates_presence_of :description, :price
  validates_uniqueness_of :description
  
  has_and_belongs_to_many :merchants
  has_many :orders
end
# == Schema Information
#
# Table name: items
#
#  id          :integer         not null, primary key
#  description :text
#  price       :float
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

