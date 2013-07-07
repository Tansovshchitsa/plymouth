class NoticesController < ApplicationController
  def index
    @notices = Notice.all.desc(:created_at).paginate(:page=>params[:page]||1,:per_page=>15)
  end
end
