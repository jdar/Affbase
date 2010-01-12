require 'spec_helper'

describe "/affiliates/edit.html.erb" do
  include AffiliatesHelper

  before(:each) do
    assigns[:affiliate] = @affiliate = stub_model(Affiliate,
      :new_record? => false,
      :domain => 'value for domain',
      :org_name => "value for org_name",
      :url => "value for url"
    )
  end

  it "renders the edit affiliate form" do
    render

    response.should have_tag("form[action=#{affiliate_path(@affiliate)}][method=post]") do
      with_tag('input#affiliate_org_name[name=?]', "affiliate[org_name]")
      with_tag('input#affiliate_org_name[domain=?]', "affiliate[domain]")
      with_tag('input#affiliate_url[name=?]', "affiliate[url]")
    end
  end
end
