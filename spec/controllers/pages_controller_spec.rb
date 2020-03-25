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

      let(:user) { create(:user) }

      before(:each) do
        allow(controller).to receive(:current_user).and_return(user)
      end


      it 'responds with a 200 OK HTTP response' do
        get :secret_page
        expect(response.status).to eq(200)
      end


      it 'renders the secret_page template' do
        get :secret_page
        expect(response).to render_template "secret_page"
      end
    end

    context 'with incorrect params' do
      it 'responds with a 302 temp redirect' do
        get :secret_page
        expect(response.status).to eq(302)
      end

      it 'displays the login page' do
        get :secret_page
        expect(response).to redirect_to login_path
      end
    end
  end
end
