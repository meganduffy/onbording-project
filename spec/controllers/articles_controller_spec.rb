require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe 'POST #create' do
    context 'with correct params' do

      let(:existing_user) { create(:user) }

      before(:each) do
        allow(User).to receive(:find_by_email).
            and_return(existing_user)
        allow_any_instance_of(User).to receive(:authenticate).
            and_return(existing_user)
      end

      it 'saves a new article to the database' do
        expect {
          post :create, params: existing_user
        }.to change(Article, :count).by(1)
      end

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
