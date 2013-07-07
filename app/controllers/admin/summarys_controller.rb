# encoding: utf-8

module Admin
  class SummarysController < AdminController
    load_and_authorize_resource

    def index
      @summarys = Summary.all.desc(:created_at).paginate(:page=>params[:page]||1,:per_page=>10)
    end

    def create
      @summary = Summary.new(params[:summary])
      if @summary.update_attributes(params[:summary])
        redirect_to admin_summarys_path
      else
        render :new
      end
    end

    def update
      if @summary.update_attributes(params[:summary])
        redirect_to admin_summarys_path, :notice => "修改成功"
      else
        render :edit
      end
    end

    def destroy
      if @summary.delete
        redirect_to admin_summarys_path, :notice => "删除成功"
      else
        redirect_to admin_summarys_path, :notice => "删除失败"
      end
    end
  end  
end

