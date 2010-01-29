require 'spec_helper'

describe Affiliate do
  before(:each) do
    @valid_attributes = Affiliate.new
  end

  it "should create a new instance given valid attributes" do
    Affiliate.create!(@valid_attributes)
  end
end
