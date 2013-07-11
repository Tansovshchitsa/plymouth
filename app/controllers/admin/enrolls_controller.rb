module Admin
	class EnrollsController < AdminController
		load_and_authorize_resource

		def index
			@newss = News.where(applied: true)		 
		end

		def create
		end

		def show
			#@enroll = News.where(applied: true).enroll.find(params[:id])
		end

		def update
		end

		def destroy
		end

	end
end