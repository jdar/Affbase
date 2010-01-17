class Affiliate < ActiveRecord::Base
  require 'resolv'
  require 'rubygems'
  require 'rwebthumb'
  include Simplificator::Webthumb
  
  after_create :generate_thumbnail 
  
  def inspect
    "organization affiliate: #{org_name}"
  end
  
  def to_s
    "#{org_name} (#{url})"
  end

  def generate_thumbnail
    wt = Webthumb.new(APP_CONFIG['webthumb_api']['key'])
    job = wt.thumbnail(:url => url)
    job.write_file(job.fetch_when_complete(:medium2), "#{RAILS_ROOT}/public/data/#{id}.png")
  end
  
  def thumbnail_url
    "/data/#{id}.png"
  end

  def thumbnail_localfile
    File.exist?("#{RAILS_ROOT}/public/data/#{id}.png") ? "#{RAILS_ROOT}/public/data/#{id}.png" : nil
  end
  
  def thumbnail_last_updated
    if thumbnail_localfile
      File.new(thumbnail_localfile).mtime.to_s(:long)
    else
      "No such file"
    end
  end
  

end
