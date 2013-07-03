class News
  include Mongoid::Document
  include Mongoid::Timestamps
  include Rails.application.routes.url_helpers


  field :title
  field :content
  field :author
  field :thumb
  field :image
  field :focus

  before_save do |news|
    news.thumb = news.content[0..20]
  end

  state_machine :initial => :new do 
    event :pass do 
      transition [:new,:notpass] => :pass
    end
    event :notpass do 
      transition :pass => :notpass
    end
  end

  def is_pass?
    state == "pass"
  end

  mount_uploader :image, FocusUploader
end
