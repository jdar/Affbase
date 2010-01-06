class ThumbnailsController < ApplicationController
  def index
    @Thumbnails = Thumbnail.all
  end

  def edit
  end

end
