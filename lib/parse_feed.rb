class ParseFeed
  require "yaml"
  require "open-uri"
  
  def initialize(url)
    open(url) {|f| @feed = YAML.load(f) }
  end
  
  def count
    @feed.size
  end
  
  def feed
    @feed
  end
  
  def org_name(id)
    @feed[id]["affiliate_name"]
  end
  
  def org_field(id, field)
    if [field]
    @feed[id][field].chomp(";")
    end 
  end
  
  def to_s 
    @feed
  end
  
  
end