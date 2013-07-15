module Admin
  class TopsController < AdminController
    load_and_authorize_resource

    def new
      @top = Top.first.nil? ? Top.new : Top.first
    end

    def create
      @top = Top.first.nil? ? Top.new : Top.first
      if @top.update_attributes(params[:top])
        redirect_to new_admin_top_path
      else
        render :new
      end
    end
  end
end
