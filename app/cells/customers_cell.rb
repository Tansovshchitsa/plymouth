class CustomersCell < Cell::Rails
	
	def new args
		@news =args[:news]
		@customer = Customer.new
		render 
	end

end