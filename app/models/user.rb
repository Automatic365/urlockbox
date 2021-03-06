class User < ApplicationRecord
  has_secure_password
  validates_presence_of :password
  validates_confirmation_of :password
  validates_presence_of :email
  validates_uniqueness_of :email
  has_many :links

end
