require 'spec_helper'

describe "/user_sessions/show.html.erb" do
  include UserSessionsHelper
  before(:each) do
    assigns[:user_session] = @user_session = stub_model(UserSession)
  end

  it "renders attributes in <p>" do
    render
  end
end
