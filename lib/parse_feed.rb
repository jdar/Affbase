class ParseFeed
  require "yaml"
  require "open-uri"
  
  def initialize(url)
    @feed = open(url) {|f| YAML.load(f) }
  end
  
  def count
    @feed.size
  end
  
  def to_s  (org)
    @feed["#{org}"]
  end
  
end