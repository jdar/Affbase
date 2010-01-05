class Affiliate < ActiveRecord::Base
  require 'resolv'
  require 'rubygems'
require 'rwebthumb'
include Simplificator::Webthumb
    

  # Modified from dzone webthumb shippet. This may not be right place. Helper? controller?
  def img
    # wt = Webthumb.new('a9fdb3aea9235c570cd22ecdc0a2c956')
    # job = wt.thumbnail(:url => url)
    # job.write_file(job.fetch_when_complete, "public/data/#{id}.png")
    img = "/data/#{id}.png"

  end

end
