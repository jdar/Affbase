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
  
  
  def generate_gmap_info_window(a)
    "#{a.org_name} <br /> #{a.address1}<br /> #{a.city}, #{a.state} #{a.zip}<br />" + image_tag(a.thumbnail_url("_small"))
  end
  
  def make_map affiliates
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    @map.set_map_type_init(GMapType::G_NORMAL_MAP)
    @map.center_zoom_init([40.57, -97.56],4)
    affiliates.each do |a|
      @map.overlay_init(GMarker.new([a.lat, a.long],:title => a.name_abbr, :info_window => generate_gmap_info_window(a)))
    end
    @map.to_html
  end

  def makp_affiliate a
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    @map.set_map_type_init(GMapType::G_NORMAL_MAP)
    @map.center_zoom_init([a.lat, a.long], 11)
    @map.overlay_init(GMarker.new([a.lat, a.long],:title => a.name_abbr, :info_window => generate_gmap_info_window(a)))
    @map.to_html
  end  
  

end
