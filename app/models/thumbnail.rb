class Thumbnail
  attr_reader :id
  require "find"
  
  def initialize(thumbnail)
    @thumbnail = thumbnail

  end
  
  def self.link
    thumbnail = "xxx"
  end
  
  def self.all
    Dir.glob("#{RAILS_ROOT}/public/data/*.png")  { |file| thumbnail.new(file) }
  end
end