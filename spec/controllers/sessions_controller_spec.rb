RSpec.describe SessionsController, type: :controller do
  describe 'POST #create' do
    context 'with correct params' do
      let(:existing_user) { create(:user) }

      before(:each) do
        allow(User).to receive(:find_by_email)
          .and_return(existing_user)
        allow_any_instance_of(User).to receive(:authenticate)
          .and_return(existing_user)
      end

      it 'redirects to homepage' do
        post :create, params: { session: { email: existing_user.email,
                                           password: existing_user.password } }
        expect(response).to redirect_to root_path
      end
      it 'returns a 302 Temp Redirect' do
        post :create, params: { session: { email: existing_user.email,
                                           password: existing_user.password } }
        expect(response.status).to eq(302)
      end
    end

    context 'without correct params' do
      let(:existing_user) { create(:user) }

      it 're-renders #new form' do
        post :create, params: { session: { email: existing_user.email } }
        expect(response).to render_template 'new'
      end
      it 'does not return a 302 Temp Redirect response' do
        post :create, params: { session: { email: existing_user.email } }
        expect(response.status).to_not eq(302)
      end
    end
  end

  describe 'DELETE #logout' do
    context 'when logout triggered' do
      let(:existing_user) { create(:user) }

      before(:each) do
        allow(User).to receive(:find_by_email)
          .and_return(existing_user)
        allow_any_instance_of(User).to receive(:authenticate)
          .and_return(existing_user)
      end

      it 'redirects to homepage' do
        post :create, params: { session: { email: existing_user.email,
                                           password: existing_user.password } }
        delete :destroy
        expect(response).to redirect_to root_path
      end

      it 'clears the session variable' do
        post :create, params: { session: { email: existing_user.email,
                                           password: existing_user.password } }
        delete :destroy
        expect(session[:user_id]).to eq(nil)
      end
    end
  end
end
