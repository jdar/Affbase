class Affiliate < ActiveRecord::Base

require 'resolv'
    
  def ip
    ip = Resolv::getaddress(url)  
    rescue Exception => e
    ip = "<span class=\"error\">IP Check Error</span>"
  end

end
