module AffiliatesHelper
  
  # ip lookup can be resource intensive - skip on dev
  def get_ip url
    unless RAILS_ENV == 'development'
      ip url    
    end
  end
  
  def ip(url)
    ip = Resolv::getaddress(url)  
    rescue Exception => e
    ip = "<span class=\"error\">IP Check Error</span>"
  end
  
  
  def autolink string
    "<a href=\"http://#{string}\">#{string}</a>"
  end
  

end
