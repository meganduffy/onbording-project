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
          expect(response).to redirect_to articles_path
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
        assigned_articles_dates = assigned_articles[0]['created_at']
        
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

  describe 'GET #edit' do
    context 'when user is logged in' do
      before(:each) do
        allow(controller).to receive(:current_user).and_return(user)
      end
      it 'returns a 200 OK HTTP response' do
        article = create(:article)
        get :edit, params: { id: article.id }
        expect(response.status).to eq(200)
      end
    end

    context 'when user is not logged in' do
      it 'returns a 302 Redirect HTTP response' do
        article = create(:article)
        get :edit, params: { id: article.id }
        expect(response.status).to eq(302)
      end

      it 'redirects to the login page' do
        article = create(:article)
        get :edit, params: { id: article.id }
        expect(response).to redirect_to login_path
      end
    end
  end

  describe 'PATCH #update' do
    context 'when user is logged in' do
      let(:article) { create(:article) }

      before(:each) do
        allow(controller).to receive(:current_user).and_return(user)
      end
      
      context 'with correct params' do
        it 'updates the details of an article' do
          article_params = {
            id: article.id,
            article: { id: article.id, title: 'New Title', content: 'New content.', user_id: user.id  }
          }      
          patch :update, params: article_params
          article.reload
          expect(article.title).to eq('New Title')
          expect(article.content).to eq('New content.')
        end

        it 'redirects the user back to the articles list page' do
          article_params = {
            id: article.id,
            article: { id: article.id, title: 'New Title', content: 'New content.', user_id: user.id  }
          }      
          patch :update, params: article_params
          expect(response).to redirect_to articles_path
        end
      end
    end 

    context 'when user is not logged in' do
      let(:article) { create(:article) }
      it 'redirects to the login page' do
        article_params = {
          id: article.id,
          article: { id: article.id, title: 'New Title', content: 'New content.', user_id: nil  }
        } 
        patch :update, params: article_params
        expect(response).to redirect_to login_path
      end
    end
  end

  describe 'GET #destroy' do
    context 'when a user is logged in' do
      let(:article) { create(:article) }

      before(:each) do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'adds a discarded at timestamp' do
        get :destroy, params: { id: article.id }
        article.reload
        expect(article.discarded_at).to_not be_nil
      end

      it 'displays a flash undo option' do
        get :destroy, params: { id: article.id }
        expect(flash[:notice]).to match(
          "You're about to delete #{article.title.upcase} <a href=\"/articles/#{article.id}/recover\">undo</a>"
        )
      end
    end

    context 'when a user is not logged in' do
      let(:article) { create(:article) }
      it 'redirects to the login page' do
        get :destroy, params: { id: article.id }
        expect(response).to redirect_to login_path
      end

      it 'does not display an undo flash' do
        get :destroy, params: { id: article.id }
        expect(flash[:notice]).to be_nil
      end
    end
  end

  describe 'GET #recover' do
    context 'when a user is logged in' do
      let(:article) { create(:article) }

      before(:each) do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'removes the discarded at timestamp' do
        get :recover, params: { id: article.id }
        article.reload
        expect(article.discarded_at).to be_nil
      end
    end

    context 'when a user is not logged in' do
      let(:article) { create(:article) }
      it 'redirects to the login page' do
        get :recover, params: { id: article.id }
        expect(response).to redirect_to login_path
      end
    end
  end
end
