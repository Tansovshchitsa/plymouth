# encoding: utf-8

module Admin
  class LinksController < AdminController
    load_and_authorize_resource

    def new
      @link = Link.new
    end

    def index
      @links = Link.all.desc(:created_at).paginate(:page=>params[:page]||1,:per_page=>10)
    end

    def create
      @link = Link.new(params[:link])
      if @link.save
        redirect_to admin_links_path
      else
        render :new
      end
    end

    def online
      if @link.online
        redirect_to admin_links_path, :notice => "上线成功"
      else
        redirect_to admin_links_path, :notice => "上线失败"
      end
    end

    def offline
      if @link.offline
        redirect_to admin_links_path, :notice => "下线成功"
      else
        redirect_to admin_links_path, :notice => "下线失败"
      end
    end

    def update
      if @link.update_attributes(params[:link])
        redirect_to admin_links_path, :notice => "修改成功"
      else
        render :edit
      end
    end

    def destroy
      if @link.delete
        redirect_to admin_links_path, :notice => "删除成功"
      else
        redirect_to admin_links_path, :notice => "删除失败"
      end
    end
  end
end
