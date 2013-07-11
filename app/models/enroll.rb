class Enroll
  include Mongoid::Document

  belongs_to :news
  # has_many :customers
  # accepts_nested_attributes_for :customers
  field :email, type: String
  field :username, type: String
  field :tel, type: String

end
