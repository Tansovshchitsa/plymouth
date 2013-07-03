# encoding: utf-8
module Admin
	class AnnouncementsController < AdminController
    load_and_authorize_resource

    def new
      @announcement = Announcement.new
    end

    def index
      @announcements = Announcement.all.desc(:created_at).paginate(:page=>params[:page]||1,:per_page=>10)
    end

    def create
      @announcement = Announcement.new(params[:announcement])
      if @announcement.save
        redirect_to admin_announcements_path
      else
        render :new
      end
    end

    def online
      if @announcement.online
        redirect_to admin_announcements_path, :notice => "上线成功"
      else
        redirect_to admin_announcements_path, :notice => "上线失败"
      end
    end

    def offline
      if @announcement.offline
        redirect_to admin_announcements_path, :notice => "下线成功"
      else
        redirect_to admin_announcements_path, :notice => "下线失败"
      end
    end

    def update
      if @announcement.update_attributes(params[:announcement])
        redirect_to admin_announcements_path, :notice => "修改成功"
      else
        render :edit
      end
    end

    def destroy
      if @announcement.delete
        redirect_to admin_announcements_path, :notice => "删除成功"
      else
        redirect_to admin_announcements_path, :notice => "删除失败"
      end
    end
	end
end
