require 'spec_helper'

describe Purchaser do
  it {should validate_presence_of :name}
  it {should have_many :orders}
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

