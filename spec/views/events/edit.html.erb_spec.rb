require 'spec_helper'

describe "/events/edit.html.erb" do
  include EventsHelper

  before(:each) do
    assigns[:event] = @event = stub_model(Event,
      :new_record? => false,
      :affiliate_id => 1,
      :name => "value for name",
      :url => "value for url",
      :location => "value for location"
    )
  end

  it "renders the edit event form" do
    render

    response.should have_tag("form[action=#{event_path(@event)}][method=post]") do
      with_tag('input#event_affiliate_id[name=?]', "event[affiliate_id]")
      with_tag('input#event_name[name=?]', "event[name]")
      with_tag('input#event_url[name=?]', "event[url]")
      with_tag('input#event_location[name=?]', "event[location]")
    end
  end
end
