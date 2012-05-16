require 'spec_helper'

describe Merchant do
  it {should validate_presence_of :address}
  it {should validate_presence_of :name}
  it {should have_and_belong_to_many :items}
  it {should have_many :orders}
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

