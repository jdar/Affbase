require 'spec_helper'

describe "/affiliates/new.html.erb" do
  include AffiliatesHelper

  before(:each) do
    assigns[:affiliate] = stub_model(Affiliate,
      :new_record? => true,
      :org_name => "value for org_name",
      :url => "value for url"
    )
  end

  it "renders new affiliate form" do
    render

    response.should have_tag("form[action=?][method=post]", affiliates_path) do
      with_tag("input#affiliate_org_name[name=?]", "affiliate[org_name]")
      with_tag("input#affiliate_url[name=?]", "affiliate[url]")
    end
  end
end
