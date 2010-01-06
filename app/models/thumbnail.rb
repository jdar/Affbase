class Thumbnail
  require "find"
  
  def initialize
    @Thumbnails = Dir.glob("#{RAILS_ROOT}/PUBLIC/DATA/*.png")

  end
  
  def self.all
    Dir.glob("#{RAILS_ROOT}/PUBLIC/DATA/*.png")
  end
end