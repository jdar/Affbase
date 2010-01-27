require 'spec_helper'

describe "/events/show.html.erb" do
  include EventsHelper
  before(:each) do
    assigns[:event] = @event = stub_model(Event,
      :affiliate_id => 1,
      :name => "value for name",
      :url => "value for url",
      :location => "value for location"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ url/)
    response.should have_text(/value\ for\ location/)
  end
end
