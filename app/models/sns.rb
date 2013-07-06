class Sns
  include Mongoid::Document
  include Rails.application.routes.url_helpers

  field :title
  field :url
  field :image

  mount_uploader :image, FocusUploader
end
