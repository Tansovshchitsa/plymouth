# encoding: utf-8

module Admin
  class TypesController < AdminController
    load_and_authorize_resource

    def new
      @type = Type.new
    end

    def index
      @types = Type.all.desc(:created_at).paginate(:page=>params[:page]||1,:per_page=>10)
    end

    def create
      @type = Type.new(params[:type])
      @type.ancestry = nil if params[:type][:ancestry] == ""
      if @type.save
        redirect_to admin_types_path
      else
        render :new
      end
    end

    def online
      if @type.online
        redirect_to admin_types_path, :notice => "上线成功"
      else
        redirect_to admin_types_path, :notice => "上线失败"
      end
    end

    def offline
      if @type.offline
        redirect_to admin_types_path, :notice => "下线成功"
      else
        redirect_to admin_types_path, :notice => "下线失败"
      end
    end

    def update
      if @type.update_attributes(params[:type])
        redirect_to admin_types_path, :notice => "修改成功"
      else
        render :edit
      end
    end

    def destroy
      if @type.delete
        redirect_to admin_types_path, :notice => "删除成功"
      else
        redirect_to admin_types_path, :notice => "删除失败"
      end
    end

    def get_type
      @result = {}
      Type.roots.each do |e|
        @result[e.title] = {}
        e.children.each do |children|
          @result[e.title][children.title] = children.id
        end
      end
      render json: @result
    end
  end  
end