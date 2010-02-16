# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def autolink( url, string=nil)
    string.nil? ? "<a href=\"http://#{url}\">#{url}</a>" : "<a href=\"http://#{url}\">#{string}</a>"
  end
end
