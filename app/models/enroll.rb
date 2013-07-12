#encoding:utf-8
class Enroll
  include Mongoid::Document

  belongs_to :news
  # has_many :customers
  # accepts_nested_attributes_for :customers
  field :email, type: String
  field :username, type: String
  field :tel, type: String

  validates :email, format: { with: /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/,
    message: "邮箱格式不正确" }
  validates :username, length: { minimum: 4 , message: "用户名长度不小于4个字符"}
  validates :tel, format: { with: /^1[3|4|5|8]\d{9}$/, 
    message: "联系方式格式不正确"}  
  validates_presence_of :username, :email, :tel
end
