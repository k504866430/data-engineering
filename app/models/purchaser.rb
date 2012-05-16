class Purchaser < ActiveRecord::Base
  attr_accessible :name
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  has_many :orders
end
# == Schema Information
#
# Table name: purchasers
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

