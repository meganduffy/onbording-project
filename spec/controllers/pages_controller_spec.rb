require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe 'GET #home' do
    context 'when viewing homepage in the browser' do
      it 'returns a 200 OK response' do
        get :home
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'GET #secret_page' do
    context 'with correct params' do
      it 'renders the secret_page template'
      it 'does not 302 temp redirect'
    end

    context 'with incorrect params' do
      it 'responds with a 302 temp redirect'
      it 'displays the login page'
    end
  end
end
