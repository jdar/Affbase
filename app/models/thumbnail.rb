class Thumbnail
  require "find"
  
  def initialize
    @Thumbnails = Dir.glob("#{RAILS_ROOT}/public/data/*.png")

  end
  
  def self.link
    thumbnail = "xxx"
  end
  
  def self.all
    Dir.glob("#{RAILS_ROOT}/public/data/*.png")
  end
end