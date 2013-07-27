# encoding: utf-8

module Admin
  class FocussController < AdminController
    load_and_authorize_resource

    def new
      @focus = Focus.new
    end

    def index
      @focuss = Focus.all.desc(:created_at).paginate(:page=>params[:page]||1,:per_page=>10)
    end

    def create
      unless params[:focus]["image"].to_s.empty?
        @focus = Focus.new(params[:focus])
        if @focus.save
          redirect_to admin_focuss_path
        else
          render :new
        end
      end
    end

    def online
      if @focus.online
        redirect_to admin_focuss_path, :notice => "上线成功"
      else
        redirect_to admin_focuss_path, :notice => "上线失败"
      end
    end

    def offline
      if @focus.offline
        redirect_to admin_focuss_path, :notice => "下线成功"
      else
        redirect_to admin_focuss_path, :notice => "下线失败"
      end
    end

    def update
      if @focus.update_attributes(params[:focus])
        redirect_to admin_focuss_path, :notice => "修改成功"
      else
        render :edit
      end
    end

    def destroy
      if @focus.delete
        redirect_to admin_focuss_path, :notice => "删除成功"
      else
        redirect_to admin_focuss_path, :notice => "删除失败"
      end
    end
  end
end