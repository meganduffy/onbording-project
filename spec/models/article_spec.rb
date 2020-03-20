require 'rails_helper'

RSpec.describe Article, type: :model do

  let(:article) { create(:article) }

  it 'is valid with all valid attributes' do
    expect(article).to be_valid
  end

  it 'is not valid without a title' do
    article.title = nil
    expect(article).to_not be_valid
  end

  it 'is not valid without content' do
    article.content = nil
    expect(article).to_not be_valid
  end

  it 'is not valid without an user' do
    article.user = nil
    expect(article).to_not be_valid
  end
end
