class Affiliate < ActiveRecord::Base
  require 'resolv'
  require 'rubygems'
  require 'rwebthumb'
  include Simplificator::Webthumb
  
  after_update { :generate_thumbnail }
  
  def inspect
    "organization affiliate: #{org_name}"
  end
  
  def to_s
    "#{org_name} (#{url})"
  end

  def generate_thumbnail
    puts "# generate thumbnail"
    wt = Webthumb.new('a9fdb3aea9235c570cd22ecdc0a2c956')
    job = wt.thumbnail(:url => url)
    job.write_file(job.fetch_when_complete, "#{RAILS_ROOT}/public/data/#{id}.png")
  end
  
  def thumbnail_url
    "/data/#{id}.png"
  end

  def thumbnail_localfile
    "#{RAILS_ROOT}/public/data/#{id}.png"
  end
  

end
