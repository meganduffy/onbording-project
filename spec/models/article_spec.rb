require 'rails_helper'

RSpec.describe Article, type: :model do

  article = Article.new(title: "New Article",
                        content: "Contrary to popular belief, Lorem Ipsum is not simply random text.
  It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
                        author: "megan.duffy@wpengine.com",
                        created_at: "2020-03-10 12:26:10")

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

  it 'is not valid without an author' do
    article.author = nil
    expect(article).to_not be_valid
  end

  it 'is not valid without a timestamp' do
    article.created_at = nil
    expect(article).to_not be_valid
  end
end
