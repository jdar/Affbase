class ThumbnailsController < ApplicationController
  def index
    @Thumbnails = Thumbnail.all
    respond_to do |format|
      format.html
    end
  end

  def edit
  end

end
