class Top
  include Mongoid::Document
  include Mongoid::Timestamps
  include Rails.application.routes.url_helpers

  field :image
  field :type
  field :color
  mount_uploader :image, FocusUploader
end
