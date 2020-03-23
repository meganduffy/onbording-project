class User < ApplicationRecord

  has_secure_password

  validates :first_name, :last_name, :presence => true
  validates :email, :presence => true, :uniqueness => true, :email => true
  validates :password_digest, :length => { :minimum => 5 }, :presence => true

  has_many :articles
end
