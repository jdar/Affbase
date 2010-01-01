class Affiliate < ActiveRecord::Base
    
  def get_ip
      begin
    ip = Resolv::getaddress(url)  
  rescue Exception => e
    ip = "<span class=\"error\">IP Check Error</span>"
  end
  end
end
