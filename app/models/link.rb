class Link
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :url

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
