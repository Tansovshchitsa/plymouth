#encoding:utf-8
class Enroll
  include Mongoid::Document

  belongs_to :news
  # has_many :customers
  # accepts_nested_attributes_for :customers
  field :email, type: String
  field :username, type: String
  field :tel, type: String

  validates :email, presence: true, format: { with: /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/,
    message: "邮箱格式不正确" }
  validates :username, presence: true, length: { minimum: 2 , message: "用户名长度不小于2个字符"}
  validates :tel, presence: true
end
