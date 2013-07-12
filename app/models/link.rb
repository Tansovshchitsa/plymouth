#encoding:utf-8
class Link
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :url
  field :type

  validates_presence_of :title,:url
  validates :url, format: { 
    with: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix,
    message: "无效的URL" }

  state_machine :initial => :new do
     event :offline do 
      transition :online => :offline
    end
    
    event :online do
      transition [:new, :offline] => :online
    end
  end

  def is_online?
    state == "online"
  end
end
