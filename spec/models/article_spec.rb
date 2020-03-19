require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'is valid with all valid attributes'
  it 'is not valid without a title'
  it 'is not valid without content'
  it 'is not valid without an author'
  it 'is not valid without a timestamp'
end
