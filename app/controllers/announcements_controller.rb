class AnnouncementsController < ApplicationController
  def index
    @announcements = Announcement.all.desc(:created_at).paginate(:page=>params[:page]||1,:per_page=>15)
  end
end