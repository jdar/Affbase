require 'spec_helper'

describe Event do
  before(:each) do
    @valid_attributes = Event.new
  end

  it "should create a new instance given valid attributes" do
    Event.create!(@valid_attributes)
  end
end
