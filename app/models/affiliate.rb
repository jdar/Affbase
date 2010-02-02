class Affiliate < ActiveRecord::Base
  require 'resolv'
  require 'rubygems'
  require 'rwebthumb'
  include Simplificator::Webthumb
  validates_uniqueness_of :domain
  validates_presence_of [:org_name, :url], :message => "can't be blank"
  validates_presence_of :lat, :long
  acts_as_mappable :auto_geocode => true 
  has_many :events
  
  def to_param
    "#{id}-#{url_id}"
  end
  
  def url_id
    domain.chomp.gsub(".","")
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
  

end
