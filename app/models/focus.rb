class Focus
  include Mongoid::Document
  include Mongoid::Timestamps
  include Rails.application.routes.url_helpers

  field :image
  field :url
  field :title

  state_machine :initial => :new do
    
    event :offline do 
      transition :online => :offline
    end
    
    event :online do
      transition [:new, :offline] => :online
    end
  end

  mount_uploader :image, FocusUploader

  def is_online?
    state == "online"
  end
end