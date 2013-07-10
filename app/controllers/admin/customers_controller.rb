# encoding: utf-8

module Admin
	class CustomersController < AdminController
		load_and_authorize_resource

		def index
			@customers = Customer.all
		end

		def create	
			@customer = Customer.new(params[:customer])
			if @customer.save
				redirect_to admin_customers_path,:notice => "添加成功"
			else
				render :new
			end
		end

		def edit
		end

		def update
			if @customer.update_attributes(params[:customer])
				redirect_to admin_customers_path, :notice => "更新成功"
			else
				render :edit
			end
		end

		def destroy
			if @customer.delete
        redirect_to admin_customers_path, :notice => "删除成功"
      else
        redirect_to admin_customers_path, :notice => "删除失败"
      end
		end

	end
end