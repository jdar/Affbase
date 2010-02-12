class Affiliate < ActiveRecord::Base
  require 'resolv'
  require 'rubygems'
  require 'rwebthumb'
  require 'geokit'
  
  include Simplificator::Webthumb
  validates_uniqueness_of :domain
  validates_presence_of [:org_name, :url], :message => "can't be blank"
  # validates_presence_of :lat, :long
  acts_as_mappable :default_units => :miles, 
                   :default_formula => :sphere, 
                   :distance_field_name => :distance,
                   :lat_column_name => :lat,
                   :lng_column_name => :long
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
    job.write_file(job.fetch_when_complete(:small), "#{RAILS_ROOT}/public/data/#{url_id}_small.png")
  end
  
  def thumbnail_url size = ""
    "/data/#{url_id}#{size}.png"
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
  
  # Generate all thumbnailsin small & medium size
  def self.generate_thumbnails
    wt = Webthumb.new(APP_CONFIG['webthumb_api']['key'])
    Affiliate.all.each do |a|  
      job = wt.thumbnail(:url => a.url)
      job.write_file(job.fetch_when_complete(:medium2), "#{RAILS_ROOT}/public/data/#{a.url_id}.png")
      job.write_file(job.fetch_when_complete(:small), "#{RAILS_ROOT}/public/data/#{a.url_id}_small.png")
    end
  end
  
  def self.search(string)
    find(:first, :conditions => ["name_abbr LIKE ?", string])
  end
  
  def self.get_states
    find(:all, :select => 'distinct(state)', :order => 'state')
  end
  
  def self.get_regions
    find(:all, :select => 'distinct(region)', :order => 'region')
  end

end
