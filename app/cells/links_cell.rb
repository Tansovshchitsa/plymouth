class LinksCell < Cell::Rails

  def index
    @links = Link.where(state: "online").desc("updated_at")
    render
  end

end