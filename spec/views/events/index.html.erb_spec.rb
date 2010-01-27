require 'spec_helper'

describe "/events/index.html.erb" do
  include EventsHelper

  before(:each) do
    assigns[:events] = [
      stub_model(Event,
        :affiliate_id => 1,
        :name => "value for name",
        :url => "value for url",
        :location => "value for location"
      ),
      stub_model(Event,
        :affiliate_id => 1,
        :name => "value for name",
        :url => "value for url",
        :location => "value for location"
      )
    ]
  end

  it "renders a list of events" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for url".to_s, 2)
    response.should have_tag("tr>td", "value for location".to_s, 2)
  end
end
