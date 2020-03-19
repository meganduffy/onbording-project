require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe 'GET #new' do
    context 'when user is logged in' do

      let(:user) { create(:user) }

      before(:each) do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'responds with a 200 OK HTTP response' do
        get :new
        expect(response.status).to eq(200)
      end


      it 'renders the new template' do
        get :new
        expect(response).to render_template "new"
      end
    end

    context 'when user is not logged in' do
      it 'resonds with a 302' do
        get :new
        expect(response.status).to eq(302)
      end

      it 'redirects to the login page' do
        get :new
        expect(response).to redirect_to '/login'
      end
    end
  end

  describe 'POST #create' do
    context 'with correct params' do

      let(:user) { create(:user) }

      before(:each) do
        allow(controller).to receive(:current_user).and_return(user)
      end

      # it 'saves a new article to the database' do
      #   expect {
      #     post :create, params: user
      #   }.to change(Article, :count).by(1)
      # end

      it 'displays a success message'
      it 'displays the article post'
    end

    context 'with incorrect params' do
      # it 'does not save a new article to the database' do
      #   expect {
      #     post :create, params: user
      #   }.to_not change(Article, :count).by(1)
      # end

      it 're-renders #new'
      it 'displays an error message'
    end
  end

end
