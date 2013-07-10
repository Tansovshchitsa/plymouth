module Admin
  class LogosController < AdminController
    load_and_authorize_resource

    def new
      @logo = Logo.first.nil? ? Logo.new : Logo.first
    end

    def create
      @logo = Logo.first.nil? ? Logo.new : Logo.first
      if @logo.update_attributes(params[:logo])
        redirect_to new_admin_logo_path
      else
        render :new
      end
    end
  end
end
