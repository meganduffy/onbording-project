RSpec.describe UsersController, type: :controller do
  describe 'POST #create' do
    context 'with correct params' do
      let(:parameters) do
        { user: { first_name: 'Megan', last_name: 'Duffy',
                  email: 'unique@email.com', password: 'hard2guess' } }
      end
      it 'redirects to homepage' do
        post :create, params: parameters
        expect(response).to redirect_to root_path
      end

      it 'returns a 302 Temp Redirect response' do
        post :create, params: parameters
        expect(response.status).to eq(302)
      end

      it 'saves a new user to the database' do
        expect do
          post :create, params: parameters
        end.to change(User, :count).by(1)
      end
    end

    context 'without correct params' do
      let(:parameters) do
        { user: { last_name: 'Duffy',
                  email: 'unique@email.com', password: 'hard2guess' } }
      end
      it 're-renders #new form' do
        post :create, params: parameters
        expect(response).to render_template 'new'
      end

      it 'does not return a 302 Temp Redirect response' do
        post :create, params: parameters
        expect(response.status).to_not eq(302)
      end

      it 'does not save a new user to the database' do
        expect do
          post :create, params: parameters
        end.to_not change(User, :count)
      end
    end
  end
end
