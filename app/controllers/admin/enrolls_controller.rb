module Admin
	class EnrollsController < AdminController
		

		def index
			@newss = News.where(applied: true).desc(:created_at).paginate(:page=>params[:page]||1,:per_page=>10)	
		end

		def show
			@news = News.find(params[:id])
			@enroll = Enroll.where(news: @news).first
			#render json: @enroll
			
		end

		def update
		end

		def destroy
		end

	end
end