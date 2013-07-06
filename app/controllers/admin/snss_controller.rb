# encoding: utf-8

module Admin
  class SnssController < AdminController
    load_and_authorize_resource

    def index
      @snss = Sns.all.desc(:created_at).paginate(:page=>params[:page]||1,:per_page=>10)
    end

    def update
      if @sns.update_attributes(params[:sns])
        redirect_to admin_snss_path, :notice => "修改成功"
      else
        render :edit
      end
    end

    def create
      @sns = Sns.new(params[:sns])
      if @sns.save
        redirect_to admin_snss_path
      else
        render :new
      end
    end

    def destroy
      if @sns.delete
        redirect_to admin_snss_path, :notice => "删除成功"
      else
        redirect_to admin_snss_path, :notice => "删除失败"
      end
    end
  end
end
