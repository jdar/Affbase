require 'spec_helper'

describe AffiliatesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/affiliates" }.should route_to(:controller => "affiliates", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/affiliates/new" }.should route_to(:controller => "affiliates", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/affiliates/1" }.should route_to(:controller => "affiliates", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/affiliates/1/edit" }.should route_to(:controller => "affiliates", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/affiliates" }.should route_to(:controller => "affiliates", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/affiliates/1" }.should route_to(:controller => "affiliates", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/affiliates/1" }.should route_to(:controller => "affiliates", :action => "destroy", :id => "1") 
    end
  end
end
