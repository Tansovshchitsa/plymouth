class News
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :content
  field :author

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
end
