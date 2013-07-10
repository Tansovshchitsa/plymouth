# encoding: utf-8

class SummarysCell < Cell::Rails
  def index
    @summary = Summary.where(type: Type.where(title: "普利茅斯简介").first).first
    render
  end
end