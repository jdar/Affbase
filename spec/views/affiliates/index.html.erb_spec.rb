require 'spec_helper'

describe "/affiliates/index.html.erb" do
  include AffiliatesHelper

  before(:each) do
    assigns[:affiliates] = [
      stub_model(Affiliate,
        :org_name => "value for org_name",
        :url => "value for url"
      ),
      stub_model(Affiliate,
        :org_name => "value for org_name",
        :url => "value for url"
      )
    ]
  end

  it "renders a list of affiliates" do
    render
    response.should have_tag("tr>td", "value for org_name".to_s, 2)
    response.should have_tag("tr>td", "value for url".to_s, 2)
  end
end
