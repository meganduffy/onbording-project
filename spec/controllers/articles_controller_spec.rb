require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe 'POST #create' do
    context 'with correct params' do
      it 'saves a new article to the database'
      it 'captures the user which created the article'
      it 'captures the time and date the article is created'
      it 'displays a success message'
    end

    context 'with incorrect params' do
      it 'does not save a new article to the database'
      it 'displays an error message'
    end
  end

end
