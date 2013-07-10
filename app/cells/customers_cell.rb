class CustomersCell < Cell::Rails
	
	def new args
		@news = args[:news]
		@customer = Customer.new
    @enroll = Enroll.new
		render 
	end

end