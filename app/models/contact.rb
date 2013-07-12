class Contact
  include Mongoid::Document

  field :title
  field :content

  validates_presence_of :title,:content
  
end
