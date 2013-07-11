module Admin
	class EnrollsController < AdminController

		def index
			@newss = News.where(applied: true).desc(:created_at).paginate(:page=>params[:page]||1,:per_page=>10)	
		end

		def show
			@news = News.find(params[:id])
			@enrolls = Enroll.where(news: @news).desc(:created_at).paginate(:page=>params[:page]||1,:per_page=>20)
		end
	end
end