#encoding:utf-8
class Sns
  include Mongoid::Document
  include Rails.application.routes.url_helpers

  field :title
  field :url
  field :image
  validates_presence_of :title,:url,:image
  validates :url, format: { 
    with: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix,
    message: "无效的URL" }

  mount_uploader :image, FocusUploader
end
