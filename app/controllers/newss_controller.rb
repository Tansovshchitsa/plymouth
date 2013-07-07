class NewssController < ApplicationController
  load_and_authorize_resource

  def index
    @newss = News.all.desc(:created_at).paginate(:page=>params[:page]||1,:per_page=>15)
  end
end
