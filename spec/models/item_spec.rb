require 'spec_helper'

describe Item do
  
  it {should validate_presence_of :description}
  it {should validate_presence_of :price}
  it {should have_and_belong_to_many :merchants}
  it {should have_many :orders}
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

