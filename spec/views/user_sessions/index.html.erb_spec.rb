require 'spec_helper'

describe "/user_sessions/index.html.erb" do
  include UserSessionsHelper

  before(:each) do
    assigns[:user_sessions] = [
      stub_model(UserSession),
      stub_model(UserSession)
    ]
  end

  it "renders a list of user_sessions" do
    render
  end
end
