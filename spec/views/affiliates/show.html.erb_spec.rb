require 'spec_helper'

describe "/affiliates/show.html.erb" do
  include AffiliatesHelper
  before(:each) do
    assigns[:affiliate] = @affiliate = stub_model(Affiliate,
      :org_name => "value for org_name",
      :url => "value for url"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ org_name/)
    response.should have_text(/value\ for\ url/)
  end
end
