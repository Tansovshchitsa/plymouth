# encoding: utf-8

module Admin
  class ContactsController < AdminController
    load_and_authorize_resource

    def index
      @contacts = Contact.all.desc(:created_at).paginate(:page=>params[:page]||1,:per_page=>10)
    end

    def update
      if @contact.update_attributes(params[:contact])
        redirect_to admin_contacts_path, :notice => "修改成功"
      else
        render :edit
      end
    end

    def create
      @contact = Contact.new(params[:contact])
      if @contact.save
        redirect_to admin_contacts_path
      else
        render :new
      end
    end

    def destroy
      if @contact.delete
        redirect_to admin_contacts_path, :notice => "删除成功"
      else
        redirect_to admin_contacts_path, :notice => "删除失败"
      end
    end
  end
end