class SummarysController < ApplicationController
  load_and_authorize_resource

  def index
    @type = Type.where(id: params[:type_id]).first
    @summary = Summary.where(type_id: params[:type_id]).first if params[:type_id]
  end
end