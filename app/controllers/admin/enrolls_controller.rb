module Admin
	class EnrollsController < AdminController
		load_and_authorize_resource

		def index
			@newss = News.where(applied: true).desc(:created_at).paginate(:page=>params[:page]||1,:per_page=>10)	
		end

		def show
			@news = News.find_by_id(params[:id])
			@enroll = Enroll.where(news: @news).first
			@users = @enroll.customers
		end

		def update
		end

		def destroy
		end

	end
end