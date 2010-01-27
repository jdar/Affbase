require 'spec_helper'

describe Event do
  before(:each) do
    @valid_attributes = {
      :affiliate_id => 1,
      :name => "value for name",
      :url => "value for url",
      :date => Time.now,
      :location => "value for location"
    }
  end

  it "should create a new instance given valid attributes" do
    Event.create!(@valid_attributes)
  end
end
