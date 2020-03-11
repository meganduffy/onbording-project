class Session < ApplicationRecord

  validates :email, :presence => true, :email => true
  validates :password_digest, :length => { :minimum => 5 }, :presence => true
end
