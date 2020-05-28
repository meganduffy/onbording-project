class Article < ApplicationRecord
  belongs_to :user

  include Discard::Model

  validates :title, :content, :user_id, presence: true
end
