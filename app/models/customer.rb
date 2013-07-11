class Customer
  include Mongoid::Document
  field :email, type: String
  field :username, type: String
  field :tel, type: String
  
  belongs_to :enroll
end
