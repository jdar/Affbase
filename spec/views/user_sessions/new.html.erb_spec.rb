require 'spec_helper'

describe "/user_sessions/new.html.erb" do
  include UserSessionsHelper

  before(:each) do
    assigns[:user_session] = stub_model(UserSession,
      :new_record? => true
    )
  end

  it "renders new user_session form" do
    render

    response.should have_tag("form[action=?][method=post]", user_sessions_path) do
    end
  end
end
