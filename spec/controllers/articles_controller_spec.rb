require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe 'POST #create' do
    context 'with correct params' do

      let(:user) { create(:user) }

      before(:each) do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'saves a new article to the database' do
        expect {
          post :create, params: user
        }.to change(Article, :count).by(1)
      end

      it 'displays a success message'
      it 'displays the article post'
    end

    context 'with incorrect params' do
      it 'does not save a new article to the database' do
        expect {
          post :create, params: user
        }.to_not change(Article, :count).by(1)
      end

      it 're-renders #new'
      it 'displays an error message'
    end
  end

end
