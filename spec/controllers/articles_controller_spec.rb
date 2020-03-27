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

      it 'redirects to the login page' do
        get :new
        expect(response).to redirect_to login_path
      end
    end
  end

  describe 'POST #create' do
    context 'when user is logged in' do
      context 'with correct params' do

        let(:article) { create(:article) }

        let(:params) { {article: {title: article.title,
                                  content: article.content}} }

        before(:each) do
          allow(controller).to receive(:current_user).and_return(article.user)
        end

        it 'saves a new article to the database' do
          expect {
            post :create, params: params
          }.to change(Article, :count).by(1)
        end

        it 'displays a success message' do
          post :create, params: params
          expect(response.request.flash[:success]).to_not be_nil
        end

        it 'redirects to homepage' do
          post :create, params: params
          expect(response).to redirect_to root_path
        end
      end

      context 'without a title included in params' do
        let(:article) { create(:article) }

        before(:each) do
          allow(controller).to receive(:current_user).and_return(article.user)
        end

        let(:params) { {article: {title: nil,
                                  content: article.content}} }

        it 'does not save a new article to the database' do
          expect {
            post :create, params: params
          }.to_not change(Article, :count)
        end
        it 're-renders #new' do
          post :create, params: params
          expect(response).to render_template "new"
        end
      end

      context 'without content included in params' do

        let(:article) { create(:article) }

        before(:each) do
          allow(controller).to receive(:current_user).and_return(article.user)
        end

        let(:params) { {article: {title: article.title,
                                  content: nil}} }

        it 'does not save a new article to the database' do
          expect {
            post :create, params: params
          }.to_not change(Article, :count)
        end
        it 're-renders #new' do
          post :create, params: params
          expect(response).to render_template "new"
        end
      end
    end

    context 'when user is not logged in' do
      it 'redirects to the login page' do
        post :create
        expect(response).to redirect_to login_path
      end
    end
  end

  describe 'GET #index' do
    context 'when user is logged in' do
      let(:user) { create(:user) }

      before(:each) do
        allow(controller).to receive(:current_user).and_return(user)
      end
      it 'renders the index template' do
        get :index
        expect(response).to render_template "index"
      end
    end


    context 'when user is not logged in' do
      it 'renders the index template' do
        get :index
        expect(response).to render_template "index"
      end
    end
  end
end
