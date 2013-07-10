# encoding: utf-8

module Admin
	class UsersController < AdminController
		load_and_authorize_resource

		def index
			@users = User.all
		end

		def create	
			@user = User.new(params[:user])
			if @user.save
				redirect_to admin_users_path,:notice => "添加成功"
			else
				render :new
			end
		end

		def edit
		end

		def update
			if @user.update_attributes(params[:user])
				redirect_to admin_users_path, :notice => "更新成功"
			else
				render :edit
			end
		end

		def destroy
			if @user.delete
        redirect_to admin_users_path, :notice => "删除成功"
      else
        redirect_to admin_users_path, :notice => "删除失败"
      end
		end

	end
end