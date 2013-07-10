class EnrollsController < ApplicationController
  load_and_authorize_resource

  def index
    @enrolls = Enroll.all
  end

  def show
    @enroll = Enroll.find(params[:id])
  end

  def new
    @enroll = Enroll.new
    @customer = Customer.new
  end

  def edit
    @enroll = Enroll.find(params[:id])
  end

  def create
    @enroll = Enroll.new(params[:enroll])
    @customer = Customer.new(params[:customer])

    if @enroll.save
      format.html { redirect_to @enroll, notice: 'Enroll was successfully created.' }
      format.json { render json: @enroll, status: :created, location: @enroll }
    else
      format.html { render action: "new" }
      format.json { render json: @enroll.errors, status: :unprocessable_entity }
    end
  end

  def update
    @enroll = Enroll.find(params[:id])

    respond_to do |format|
      if @enroll.update_attributes(params[:enroll])
        format.html { redirect_to @enroll, notice: 'Enroll was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @enroll.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @enroll = Enroll.find(params[:id])
    @enroll.destroy

    respond_to do |format|
      format.html { redirect_to enrolls_url }
      format.json { head :no_content }
    end
  end
end
