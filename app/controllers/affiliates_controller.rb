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

    respond_to do |format|
      format.html # list.html.erb
      format.xml  { render :xml => @affiliates }
    end
  end 

  # GET /affiliates/getfeed
  def getfeed
    @affiliates = Affiliate.all
    @feed = ParseFeed.new("http://ucp.org/sandbox/activeaffiliates.cfm?apikey=#{APP_CONFIG['ucp_api']['key']}")
    respond_to do |format|
      flash[:notice] = "#{@feed.count} records available "
      format.html { render :action => "feed"  }
      format.xml  { render :xml => "feed" }
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
      format.html { redirect_to(@affiliate, :action => "edit")  }
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
