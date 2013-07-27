class Notice
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :content
  field :author
  field :thumb
end
