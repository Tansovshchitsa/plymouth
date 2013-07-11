# encoding: utf-8
module Admin
	class EnrollsController < AdminController
		require "spreadsheet"

		def index
			@newss = News.where(applied: true).desc(:created_at).paginate(:page=>params[:page]||1,:per_page=>10)			
		end

		def show
			@news = News.find(params[:id])
			@enrolls = Enroll.where(news: @news).desc(:created_at).paginate(:page=>params[:page]||1,:per_page=>20)
			
			respond_to do |format|  
		    format.xls {   
		      send_data( to_xls(@enrolls),  
		                :type => "text/excel;charset=utf-8; header=present",  
		                :filename => "#{@news.title}活动报名表.xls")  
		    }  
		    format.html
  		end  	
		end


		private

		def to_xls(objs)
			Spreadsheet.client_encoding = "UTF-8"
			xls_report = StringIO.new  
		  book = Spreadsheet::Workbook.new  
		  sheet1 = book.create_worksheet :name => "活动报名表"  
		  format = Spreadsheet::Format.new :color => :black, :weight => :bold, :size => 15 , :align => :merge ,:underline =>true 
		  blue = Spreadsheet::Format.new :color => :blue, :weight => :bold, :size => 11  
		  sheet1.row(0).default_format = format
		  sheet1.row(1).default_format = blue 
		  test_row = sheet1.row(0)
		  sheet1.row(0).height=30
		  sheet1.row(1).height=20
		  4.times do |i|
      	test_row.set_format(i,format)
    	end 

		  test_row[0] = "#{@news.title}活动报名名单"
		  sheet1.row(1).concat %w{序号 用户名 联系方式 邮箱}

		  count_row = 2 
		  objs.each do |obj| 
		  	sheet1[count_row,0] = (count_row -1).to_s 
		    sheet1[count_row,1] = obj.username
		    sheet1[count_row,2] = obj.tel
		    sheet1[count_row,3] = obj.email
		    count_row = count_row + 1
		  end  
		  sheet1[count_row+1,2] = "总计："
		  sheet1[count_row+1,3] = "    #{count_row -2}人"
		  
		  book.write xls_report  
		  xls_report.string  
		end
	end	
end