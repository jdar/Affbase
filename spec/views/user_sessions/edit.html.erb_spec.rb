require 'spec_helper'

describe "/user_sessions/edit.html.erb" do
  include UserSessionsHelper

  before(:each) do
    assigns[:user_session] = @user_session = stub_model(UserSession,
      :new_record? => false
    )
  end

  it "renders the edit user_session form" do
    render

    response.should have_tag("form[action=#{user_session_path(@user_session)}][method=post]") do
    end
  end
end
