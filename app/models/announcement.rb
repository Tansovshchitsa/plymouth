class Announcement
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content
  field :author

  validates_presence_of :author
end
