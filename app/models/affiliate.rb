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
    wt = Webthumb.new(APP_CONFIG['webthumb_api']['key'])
    job = wt.thumbnail(:url => url)
    job.write_file(job.fetch_when_complete(:medium2), "#{RAILS_ROOT}/public/data/#{id}.png")
  end
  
  def thumbnail_url
    "#{APP_CONFIG['relative_url_root']}/data/#{id}.png"
  end

  def thumbnail_localfile
    "#{RAILS_ROOT}/public/data/#{id}.png" if File.exist?("#{RAILS_ROOT}/public/data/#{id}.png")
  end
  
  def thumbnail_last_updated
    if thumbnail_localfile
      File.new(thumbnail_localfile).mtime.to_s(:long)
    else
      "No such file"
    end
  end
  

end
