class Announcement
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content
  field :author
end
