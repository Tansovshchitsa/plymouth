class Enroll
  include Mongoid::Document

  belongs_to :news
  has_many :customers
end
