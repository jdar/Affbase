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
  
  def to_s 
    @feed
  end
  
  
end