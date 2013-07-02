# encoding: utf-8

module Admin
  class NewssController < AdminController
    load_and_authorize_resource

    def index
      @newss = News.all.desc(:created_at).paginate(:page=>params[:page]||1,:per_page=>10)
    end

    def create
      @news = News.new(params[:news])
      if @news.save
        redirect_to admin_newss_path, :notice => "发布成功"
      else
        render :new
      end
    end

    def update
      if @news.update_attributes(params[:news])
        redirect_to admin_newss_path, :notice => "修改成功"
      else
        render :edit
      end
    end

    def destroy
      if @news.delete
        redirect_to admin_newss_path, :notice => "删除成功"
      else
        redirect_to admin_newss_path, :notice => "删除失败"
      end
    end

    def pass
      if @news.pass
        redirect_to admin_newss_path, :notice => "上线成功"
      else
        redirect_to admin_newss_path, :notice => "上线失败"
      end
    end

    def offline
      if @news.notpass
        redirect_to admin_newss_path, :notice => "下线成功"
      else
        redirect_to admin_newss_path, :notice => "下线失败"
      end
    end
  end
end
