class Merchant < ActiveRecord::Base
  attr_accessible :address, :name
  
  validates_presence_of :address, :name
  validates_uniqueness_of :address, :scope=>:name
  
  has_and_belongs_to_many :items
  has_many :orders
end
# == Schema Information
#
# Table name: merchants
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  address    :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

