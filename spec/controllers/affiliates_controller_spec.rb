require 'spec_helper'

describe AffiliatesController do

  def mock_affiliate(stubs={})
    @mock_affiliate ||= mock_model(Affiliate, stubs)
  end

  describe "GET index" do
    it "assigns all affiliates as @affiliates" do
      Affiliate.stub!(:find).with(:all).and_return([mock_affiliate])
      get :index
      assigns[:affiliates].should == [mock_affiliate]
    end
  end
  
  describe "GET List" do
    it "Should list all affiliates in tabular form" do
      get 'list'
      response.should be_success
          end
  end

  describe "GET show" do
    it "assigns the requested affiliate as @affiliate" do
      Affiliate.stub!(:find).with("37").and_return(mock_affiliate)
      get :show, :id => "37"
      assigns[:affiliate].should equal(mock_affiliate)
    end
  end

  # describe "GET new" do
  #   it "assigns a new affiliate as @affiliate" do
  #     Affiliate.stub!(:new).and_return(mock_affiliate)
  #     get :new
  #     assigns[:affiliate].should equal(mock_affiliate)
  #   end
  # end
  # 
  # describe "GET edit" do
  #   it "assigns the requested affiliate as @affiliate" do
  #     Affiliate.stub!(:find).with("37").and_return(mock_affiliate)
  #     get :edit, :id => "37"
  #     assigns[:affiliate].should equal(mock_affiliate)
  #   end
  # end
  # 
  # describe "POST create" do
  # 
  #   describe "with valid params" do
  #     it "assigns a newly created affiliate as @affiliate" do
  #       Affiliate.stub!(:new).with({'these' => 'params'}).and_return(mock_affiliate(:save => true))
  #       post :create, :affiliate => {:these => 'params'}
  #       assigns[:affiliate].should equal(mock_affiliate)
  #     end
  # 
  #     it "redirects to the created affiliate" do
  #       Affiliate.stub!(:new).and_return(mock_affiliate(:save => true))
  #       post :create, :affiliate => {}
  #       response.should redirect_to(affiliate_url(mock_affiliate))
  #     end
  #   end
  # 
  #   describe "with invalid params" do
  #     it "assigns a newly created but unsaved affiliate as @affiliate" do
  #       Affiliate.stub!(:new).with({'these' => 'params'}).and_return(mock_affiliate(:save => false))
  #       post :create, :affiliate => {:these => 'params'}
  #       assigns[:affiliate].should equal(mock_affiliate)
  #     end
  # 
  #     it "re-renders the 'new' template" do
  #       Affiliate.stub!(:new).and_return(mock_affiliate(:save => false))
  #       post :create, :affiliate => {}
  #       response.should render_template('new')
  #     end
  #   end
  # 
  # end
  # 
  # describe "PUT update" do
  # 
  #   describe "with valid params" do
  #     it "updates the requested affiliate" do
  #       Affiliate.should_receive(:find).with("37").and_return(mock_affiliate)
  #       mock_affiliate.should_receive(:update_attributes).with({'these' => 'params'})
  #       put :update, :id => "37", :affiliate => {:these => 'params'}
  #     end
  # 
  #     it "assigns the requested affiliate as @affiliate" do
  #       Affiliate.stub!(:find).and_return(mock_affiliate(:update_attributes => true))
  #       put :update, :id => "1"
  #       assigns[:affiliate].should equal(mock_affiliate)
  #     end
  # 
  #     it "redirects to the affiliate" do
  #       Affiliate.stub!(:find).and_return(mock_affiliate(:update_attributes => true))
  #       put :update, :id => "1"
  #       response.should redirect_to(affiliates_url)
  #     end
  #   end
  # 
  #   describe "with invalid params" do
  #     it "updates the requested affiliate" do
  #       Affiliate.should_receive(:find).with("37").and_return(mock_affiliate)
  #       mock_affiliate.should_receive(:update_attributes).with({'these' => 'params'})
  #       put :update, :id => "37", :affiliate => {:these => 'params'}
  #     end
  # 
  #     it "assigns the affiliate as @affiliate" do
  #       Affiliate.stub!(:find).and_return(mock_affiliate(:update_attributes => false))
  #       put :update, :id => "1"
  #       assigns[:affiliate].should equal(mock_affiliate)
  #     end
  # 
  #     it "re-renders the 'edit' template" do
  #       Affiliate.stub!(:find).and_return(mock_affiliate(:update_attributes => false))
  #       put :update, :id => "1"
  #       response.should render_template('edit')
  #     end
  #   end
  # 
  # end
  # 
  # describe "DELETE destroy" do
  #   it "destroys the requested affiliate" do
  #     Affiliate.should_receive(:find).with("37").and_return(mock_affiliate)
  #     mock_affiliate.should_receive(:destroy)
  #     delete :destroy, :id => "37"
  #   end
  # 
  #   it "redirects to the affiliates list" do
  #     Affiliate.stub!(:find).and_return(mock_affiliate(:destroy => true))
  #     delete :destroy, :id => "1"
  #     response.should redirect_to(affiliates_url)
  #   end
  # end

end
