class FocussCell < Cell::Rails
  def index
    @focuss = Focus.where(state: "online").desc(:updated_at)[0..5]
    render
  end
end