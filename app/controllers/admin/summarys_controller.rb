module Admin
  class SummarysController < AdminController
    load_and_authorize_resource
    def new
      @summary = Summary.all.first.nil? ? Summary.new : Summary.all.first
    end

    def create
      @summary = Summary.all.first.nil? ? Summary.new : Summary.all.first
      @summary.update_attributes(params[:summary])
      redirect_to new_admin_summary_path
    end
  end  
end

