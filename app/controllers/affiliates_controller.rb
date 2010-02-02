class AffiliatesController < ApplicationController
  # GET /affiliates
  # GET /affiliates.xml
  def index
    @affiliates = Affiliate.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @affiliates }
    end
  end

  # GET /affiliates/list
  # GET /affiliates/list.xml
  def list
    @affiliates = Affiliate.all
        @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    @map.center_zoom_init([75.5,-42.56],9)
    @map.overlay_init(GMarker.new([75.6,-42.467],:title => "Hello", :info_window => "Info! Info!"))
    
    respond_to do |format|
      format.html # list.html.erb
      format.xml  { render :xml => @affiliates }
    end
  end 

 # GET /affiliates/getfeed
  def feed
    @affiliates = Affiliate.all
    require 'yaml'
    require 'open-uri'
    @feed = YAML.load(open("http://ucp.org/sandbox/activeaffiliates.cfm?apikey=#{APP_CONFIG['ucp_api']['key']}"))
    @feed.each do |f,org|
      a = Affiliate.find_by_org_name(org["affiliate_name"].chomp(';')) 
        unless a.nil?
          a.siteid = org["affiliate_id"].chomp(';') 
          a.name_abbr = org["affiliate_name_abbr"].chomp(';')
          a.address1 = org["affiliate_address1"].value.chomp(';')
          a.city = org["affiliate_city"].chomp(';')
          a.state = org["affiliate_state"].chomp(';')  
          a.zip = org["affiliate_zip"].chomp(';')
          a.contact_first_name = org["affiliate_contact_first_name"].chomp(';').delete '~'
          a.contact_last_name = org["affiliate_contact_last_name"].chomp(';').delete '~'
          a.contact_email = org["affiliate_contact_email"].chomp(';').delete '~'
          a.phone1 = org["affiliate_phone1"].chomp(';').delete '~'
          a.phone2 = org["affiliate_phone2"].chomp(';').delete '~'
          a.tty = org["affiliate_tty"].chomp(';').delete '~'
          a.fax = org["affiliate_fax"].chomp(';').delete '~'
          a.email = org["affiliate_email"].chomp(';').delete '~'
          a.description = org["affiliate_description"].chomp(';').delete '~'
          a.metric      = org["affiliate_metric"].chomp(';').delete '~'
          a.activate    = org["affiliate_activate"].chomp(';').delete '~'
          a.public      = org["affiliate_public"].chomp(';').delete '~'
          a.region      = org["affiliate_region"].chomp(';').delete '~'
          a.province    = org["affiliate_province"].chomp(';').delete '~'
          a.country     = org["affiliate_country"].chomp(';').delete '~'
          a.aff_type        = org["affiliate_type"].chomp(';').delete '~'
          a.template    = org["affiliate_template"].chomp(';')
          a.state_ind   = org["affiliate_state_ind"].chomp(';')
          a.save
        end
    end
      
    
    respond_to do |format|
      # flash[:notice] = "#{@feed.count} records available "
      format.html 
      format.xml  { render :xml => @affiliates }
    end

    
  end
  
  
  # GET /affiliates/1
  # GET /affiliates/1.xml
  def show
    @affiliate = Affiliate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @affiliate }
    end 
  end

  # GET /affiliates/state/fl
  # GET /affiliates/state/fl.xml
  def find_by_state
    @affiliates = Affiliate.find_all_by_state(params[:id])
    @filtered_by = "in #{params[:id]}"
    
    respond_to do |format|
      format.html { render :action => "list"}  # list.html.erb
      format.xml  { render :action => "list", :xml => @affiliates }
    end 
  end

  # GET /affiliates/new
  # GET /affiliates/new.xml
  def new
    @affiliate = Affiliate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @affiliate }
    end
  end

  # GET /affiliates/1/edit
  def edit
    @affiliate = Affiliate.find(params[:id])
  end
  
  # POST /affiliates
  # POST /affiliates.xml
  def create
    @affiliate = Affiliate.new(params[:affiliate])

    respond_to do |format|
      if @affiliate.save
        flash[:notice] = 'Affiliate was successfully created.'
        format.html { redirect_to(@affiliate) }
        format.xml  { render :xml => @affiliate, :status => :created, :location => @affiliate }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @affiliate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /affiliates/1
  # PUT /affiliates/1.xml
  def update
    @affiliate = Affiliate.find(params[:id])
    respond_to do |format|
      if @affiliate.update_attributes(params[:affiliate])
        flash[:notice] = 'Affiliate was successfully updated.'
        format.html { redirect_to(affiliates_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @affiliate.errors, :status => :unprocessable_entity }
      end
    end
  end

  def regenerate_thumb
    @affiliate = Affiliate.find(params[:id])
    @affiliate.generate_thumbnail

    respond_to do |format|
      flash[:notice] = 'Thumbnail successfully regenerated.'
      format.html { redirect_to( :action => "list")  }
      format.xml  { head :ok }

    end
  end

  # DELETE /affiliates/1
  # DELETE /affiliates/1.xml
  def destroy
    @affiliate = Affiliate.find(params[:id])
    File.delete(@affiliate.thumbnail_localfile) unless not @affiliate.thumbnail_localfile
    @affiliate.destroy

    respond_to do |format|
      format.html { redirect_to(affiliates_url) }
      format.xml  { head :ok }
    end
  end
end
