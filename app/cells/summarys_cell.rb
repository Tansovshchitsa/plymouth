class SummarysCell < Cell::Rails
  def index
    @summary = Summary.all.first.nil? ? Summary.new : Summary.all.first
    render
  end
end