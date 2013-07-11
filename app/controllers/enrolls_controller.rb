# encoding: utf-8

class EnrollsController < ApplicationController
  load_and_authorize_resource

  def new  
  end

  def create
    @enroll = Enroll.new(params[:enroll])

    if @enroll.save
      redirect_to news_path(@enroll.news), :notice => "报名成功！"
    else
      redirect_to news_path(@enroll.news), :notice => "#{@enroll.errors[:email]} #{@enroll.errors[:username]} #{@enroll.errors[:tel]}"
    end
  end

end
