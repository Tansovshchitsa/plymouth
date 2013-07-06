# encoding: utf-8

class LinksCell < Cell::Rails

  def index
    @links = Link.where(state: "online", type: "友情链接").desc("updated_at")
    render
  end

  def about
    @links = Link.where(state: "online", type: "关于学联").desc("updated_at")
    render
  end

end