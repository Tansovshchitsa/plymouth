class Summary
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content
  field :thumb

  before_save do |summary|
    summary.thumb = summary.content[0..200]
  end
end