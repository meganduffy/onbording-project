RSpec.describe ArticlesController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #new' do
    context 'when user is logged in' do
      before(:each) do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'responds with a 200 OK HTTP response' do
        get :new
        expect(response.status).to eq(200)
      end

      it 'renders the new template' do
        get :new
        expect(response).to render_template 'new'
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

        let(:params) do
          { article: { title: article.title,
                       content: article.content } }
        end

        before(:each) do
          allow(controller).to receive(:current_user).and_return(article.user)
        end

        it 'saves a new article to the database' do
          expect do
            post :create, params: params
          end.to change(Article, :count).by(1)
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

        let(:params) do
          { article: { title: nil,
                       content: article.content } }
        end

        it 'does not save a new article to the database' do
          expect do
            post :create, params: params
          end.to_not change(Article, :count)
        end
        it 're-renders #new' do
          post :create, params: params
          expect(response).to render_template 'new'
        end
      end

      context 'without content included in params' do
        let(:article) { create(:article) }

        before(:each) do
          allow(controller).to receive(:current_user).and_return(article.user)
        end

        let(:params) do
          { article: { title: article.title,
                       content: nil } }
        end

        it 'does not save a new article to the database' do
          expect do
            post :create, params: params
          end.to_not change(Article, :count)
        end
        it 're-renders #new' do
          post :create, params: params
          expect(response).to render_template 'new'
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
      before(:each) do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'fetches a list of articles reverse ordered by creation date' do
        article1 = create(:article)
        article2 = create(:article)
        get :index

        assigned_articles = assigns(:articles)
        assigned_articles_dates = []
        assigned_articles.each { |article| assigned_articles_dates.append(article['created_at']) }
        
        expect(assigned_articles_dates[0]).to be > assigned_articles_dates[1]
      end

      it 'returns a 200 OK HTTP response' do
        get :index
        expect(response.status).to eq(200)
      end
    end

    context 'when user is not logged in' do
      it 'fetches a list of articles reverse ordered by creation date' do
        article1 = create(:article)
        article2 = create(:article)
        get :index
        
        assigned_articles = assigns(:articles)
        assigned_articles_dates = []
        assigned_articles.each { |article| assigned_articles_dates.append(article['created_at']) }
        
        expect(assigned_articles_dates[0]).to be > assigned_articles_dates[1]
      end

      it 'returns a 200 OK HTTP response' do
        get :index
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'GET #show' do
    context 'when user is logged in' do
      before(:each) do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'returns a 200 OK HTTP response' do
        article = create(:article)
        get :show, params: { id: article.id }
        expect(response.status).to eq(200)
      end
    end

    context 'when user is not logged in' do
      it 'returns a 200 OK HTTP response' do
        article = create(:article)
        get :show, params: { id: article.id }
        expect(response.status).to eq(200)
      end
    end
  end
end
