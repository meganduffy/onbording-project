class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class User < ApplicationRecord

  has_secure_password

  validates :first_name, :last_name, :password_digest, :presence => true
  validates :email, :presence => true, :uniqueness => true, :email => true

end
