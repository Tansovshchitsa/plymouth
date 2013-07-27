class HomeController < ApplicationController
  def index
    @announcement = Announcement.last
  end
end
