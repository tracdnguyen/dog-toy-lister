class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true ##redundant as has_secure_password checks for password validation

  has_many :toys
end
