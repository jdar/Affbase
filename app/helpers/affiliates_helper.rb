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
  
  
  def autolink( url, string=nil)
    string.nil? ? "<a href=\"http://#{url}\">#{url}</a>" : "<a href=\"http://#{url}\">#{string}</a>"
  end
  
  def generate_gmap_info_window(org)
    “#{org.org_name}
    #{org.address1}
    #{org.city}, #{org.state} #{org.ziorg.to_s}”
  end
  
  

end
