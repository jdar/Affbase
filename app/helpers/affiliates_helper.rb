module AffiliatesHelper
  def get_ip url
    ip = Resolv::getaddress(url)  
    rescue Exception => e
    ip = "<span class=\"error\">IP Check Error</span>"
  end
  def autolink string
    "<a href=\"http://#{string}\">#{string}</a>"
  end
  

end
