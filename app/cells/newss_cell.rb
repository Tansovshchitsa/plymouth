class NewssCell < Cell::Rails
  def home_news_list
    @newss = News.where(state: "pass", focus: "false").desc(:created_at).paginate(:page=>1,:per_page=>6)
    render
  end

  def home_news_focus
    @news = News.where(focus: "true", state: "pass").desc(:created_at).paginate(:page=>1,:per_page=>1).first
    render
  end

  def foot_news
    @newss = News.where(state: "pass").desc(:updated_at).paginate(:page=>1,:per_page=>5)
    render
  end
end