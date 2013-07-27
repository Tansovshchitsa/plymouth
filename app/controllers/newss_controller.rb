class NewssController < ApplicationController
  load_and_authorize_resource

  def index
    @type = Type.where(id: params[:type_id]).first
    unless params[:type_id].to_s == ""
      @newss = News.where(:type_id => params[:type_id]).desc(:created_at).paginate(:page=>params[:page]||1,:per_page=>15)
    else
      @newss = News.all.desc(:created_at).paginate(:page=>params[:page]||1,:per_page=>15)
    end
  end
end
