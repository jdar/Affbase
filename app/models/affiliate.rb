class Affiliate < ActiveRecord::Base
  require 'resolv'
  require 'rubygems'
  require 'rwebthumb'
  include Simplificator::Webthumb
  validates_uniqueness_of :domain
  validates_presence_of [:org_name, :url], :message => "can't be blank"
  # validates_presence_of :lat, :long
  # acts_as_mappable :auto_geocode => true 
  has_many :events
  
  def to_param
    "#{id}-#{url_id}"
  end
  
  def url_id
    domain.nil? ? "missing" : domain.chomp.gsub(".","")
  end
  
  
  def generate_thumbnail
    wt = Webthumb.new(APP_CONFIG['webthumb_api']['key'])
    job = wt.thumbnail(:url => url)
    job.write_file(job.fetch_when_complete(:medium2), "#{RAILS_ROOT}/public/data/#{url_id}.png")
  end
  
  def thumbnail_url
    "/data/#{url_id}.png"
  end

  def thumbnail_localfile
    File.exist?("#{RAILS_ROOT}/public/data/#{url_id}.png") ? "#{RAILS_ROOT}/public/data/#{url_id}.png" : nil
  end
  
  def thumbnail_last_updated
    if thumbnail_localfile
      File.new(thumbnail_localfile).mtime.to_s(:short)
    else
      nil
    end
  end
  
  def active?
    activate ? "Active" : "Not Active"
  end
  
  def contact_name
    contact_first_name + " " + contact_last_name
  end

  
  def combined_addsess
    address1 + ', ' + city + ', ' + state
    
  end
  
    
  def geocode_address
    geo = GeoKit::Geocoders::MultiGeocoder.geocode(combined_addsess)
    errorrs.add(:combined_addsess, "Could no geocode #{combined_addsess}") unless geo.success
    self.lat, self.long = geo.lat, geo.lng if geo.success
  end
  
  
  def self.update_from_affnet
     require 'yaml'
    require 'open-uri'
    @feed = YAML.load(open("http://ucp.org/sandbox/activeaffiliates.cfm?apikey=#{APP_CONFIG['ucp_api']['key']}"))
    @feed.each do |f,org|
      unless org["affiliate_name"].nil?
     a = Affiliate.find_or_create_by_org_name(org["affiliate_name"].chomp(';')) 
          a.siteid = org["affiliate_id"].chomp(';') 
          a.name_abbr = org["affiliate_name_abbr"].chomp(';')
          a.address1 = org["affiliate_address1"].value.chomp(';') unless org["affiliate_address1"].nil?
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
          a.geocode_address
          a.save
        end
    end
  end

end
